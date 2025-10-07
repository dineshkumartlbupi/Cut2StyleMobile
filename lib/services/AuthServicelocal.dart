import 'dart:convert';
import 'package:cut2style/controllers/auth_controller.dart';
import 'package:cut2style/core/constants/api_end_points.dart';
import 'package:cut2style/data/local/local_storage_service.dart';
import 'package:cut2style/data/local/secure_storage_service.dart';
import 'package:cut2style/models/UserModel.dart';
import 'package:cut2style/services/api_service.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  AuthController controller = AuthController();
  static AuthService get to => Get.find();
  final _secureStorage = SecureStorageService();
  final _localStorageService = LocalStorageService();
  Rxn<UserModel> currentUser = Rxn<UserModel>();
  RxBool isLoggedIn = false.obs;

  /// Initialize service at app launch
  Future<AuthService> init() async {
    await loadUser();
    return this;
  }

  /// Loads stored user from shared prefs
  Future<void> loadUser() async {
    final userJson = _localStorageService.getString('user_data');
    if (userJson != null) {
      final userMap = jsonDecode(userJson);
      currentUser.value = UserModel.fromJson(userMap);
      isLoggedIn.value = true;
    }
  }

  /// Login using local credentials
  Future<bool> login(String email, String password) async {
    try {
      final body = {
        "email": email,
        "password": password,
      };

      print("RequestBody : $body");
      final res = await ApiService.post(ApiEndpoints.login, body);
      print("✅ LOGIN RESPONSE: ${res?.data}");
      print("✅ LOGIN RESPONSE: ${res?.statusCode}");
      print("✅ LOGIN RESPONSE: ${res?.data['token']}");
      print(res);

      if (res?.statusCode == 200 && res?.data['token'] != null) {
        await _secureStorage.write('auth_token', res?.data['token']);
        await ApiService.setup(); // Update Dio header with new token

        currentUser.value = UserModel.fromJson(res?.data['user']);
        isLoggedIn.value = true;
        await _localStorageService.setString(
            'user_data', jsonEncode(currentUser.value?.toJson()));

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Login error: $e');
      return false;
    }
  }

  /// Register and store user locally
  Future<bool> register(
    String role,
    String name,
    String gender,
    String dob,
    String address,
    String email,
    String password,
    String cnfPassword,
  ) async {
    try {
      final body = {
        "role": role,
        "name": name,
        "gender": gender,
        "dob": dob,
        "address": address,
        "email": email,
        "password": password,
        "password_confirmation": cnfPassword,
      };

      print("Register RequestBody: $body");

      final res = await ApiService.post(ApiEndpoints.register, body);

      if (res != null) {
        print("✅ REGISTER RESPONSE DATA: ${res.data}");

        if (res.statusCode == 200 && res.data['token'] != null) {
          // Save token
          await _secureStorage.write('auth_token', res.data['token']);
          await _localStorageService.setString(
              'user_data', jsonEncode(currentUser.value?.toJson()));
          await ApiService.setup();
          currentUser.value = UserModel.fromJson(res.data['user']);
          isLoggedIn.value = true;

          print("Registration successful. User: ${currentUser.value?.name}");
          return true;
        } else {
          print("Registration failed: Token not found or invalid response.");
        }
      } else {
        print("API response is null.");
      }
    } catch (e, stackTrace) {
      print("Exception in register(): $e");
      print("StackTrace: $stackTrace");
    }

    return false;
  }

  Future<void> logout() async {
    await _localStorageService.remove('user_data');
    await _secureStorage.clearAll();
    currentUser.value = null;
    isLoggedIn.value = false;
  }

  /// Register and store user locally
  Future<bool> updateProfile(
    String name,
    String gender,
    String dob,
    String address,
    String email,
  ) async {
    try {
      final body = {
        "name": name,
        "gender": gender,
        "dob": dob,
        "address": address,
        "email": email,
      };

      print("Register RequestBody: $body");

      final res = await ApiService.post(ApiEndpoints.updateProfile, body);

      if (res != null) {
        print("✅ UPdate profile RESPONSE DATA: ${res.data}");

        if (res.statusCode == 200) {
          // Save token
          await _localStorageService.setString(
              'user_data', jsonEncode(currentUser.value?.toJson()));
          await ApiService.setup();
          currentUser.value = UserModel.fromJson(res.data['user']);
          isLoggedIn.value = true;

          print("Update  profile: ${currentUser.value?.name}");
          return true;
        } else {
          print("update profile failed: Token not found or invalid response.");
        }
      } else {
        print("API response is null.");
      }
    } catch (e, stackTrace) {
      print("Exception in register(): $e");
      print("StackTrace: $stackTrace");
    }

    return false;
  }
}
