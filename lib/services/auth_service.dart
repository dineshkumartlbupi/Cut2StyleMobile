import 'package:cut2style/app/routes/app_routes.dart';
import 'package:cut2style/core/constants/api_end_points.dart';
import 'package:cut2style/models/UserModel.dart';
import 'package:cut2style/services/api_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  final _storage = const FlutterSecureStorage();

  Rxn<UserModel> currentUser = Rxn<UserModel>();
  RxBool isLoggedIn = false.obs;

  /// Called when the app starts (from main.dart)
  Future<AuthService> init() async {
    await loadUser();
    return this;
  }

  Future<void> loadUser() async {
    final token = await _storage.read(key: 'auth_token');
    if (token != null) {
      await ApiService.setup(); // Inject token into Dio
      final res = await ApiService.get(ApiEndpoints.userProfile);
      if (res!.statusCode == 200) {
        currentUser.value = UserModel.fromJson(res.data);
        isLoggedIn.value = true;
      }
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      final res = await ApiService.post(ApiEndpoints.login, {
        'email': email,
        'password': password,
      });

      if (res!.statusCode == 200 && res.data['token'] != null) {
        await _storage.write(key: 'auth_token', value: res.data['token']);
        await ApiService.setup(); // Update Dio header with new token
        currentUser.value = UserModel.fromJson(res.data['user']);
        isLoggedIn.value = true;
        return true;
      }
      return false;
    } catch (e) {
      print('Login error: $e');
      return false;
    }
  }

  Future<bool> register(String role, String name, String gender, String email,
      String password) async {
    try {
      final res = await ApiService.post(ApiEndpoints.login, {
        'role': role,
        'name': name,
        'gender': gender,
        'email': email,
        'password': password,
      });

      if (res!.statusCode == 200 && res.data['token'] != null) {
        await _storage.write(key: 'auth_token', value: res.data['token']);
        await ApiService.setup();
        currentUser.value = UserModel.fromJson(res.data['user']);
        isLoggedIn.value = true;
        return true;
      }
      return false;
    } catch (e) {
      print('Login error: $e');
      return false;
    }
  }

  Future<void> logout() async {
    await _storage.delete(key: 'auth_token');
    currentUser.value = null;
    isLoggedIn.value = false;
    Get.offAllNamed(AppRoutes.login);
  }
}
