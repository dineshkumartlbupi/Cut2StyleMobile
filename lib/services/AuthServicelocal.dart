import 'dart:convert';
import 'package:cut2style/core/constants/api_end_points.dart';
import 'package:cut2style/models/UserModel.dart';
import 'package:cut2style/services/api_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();
  final _storage = const FlutterSecureStorage();
  Rxn<UserModel> currentUser = Rxn<UserModel>();
  RxBool isLoggedIn = false.obs;

  /// Initialize service at app launch
  Future<AuthService> init() async {
    await loadUser();
    return this;
  }

  /// Loads stored user from shared prefs
  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user_data');
    if (userJson != null) {
      final userMap = jsonDecode(userJson);
      currentUser.value = UserModel.fromJson(userMap);
      isLoggedIn.value = true;
    }
  }

  /// Login using local credentials
  Future<bool> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final storedUserJson = prefs.getString('user_data');

    if (storedUserJson != null) {
      final storedUser = UserModel.fromJson(jsonDecode(storedUserJson));
      if (storedUser.email == email && storedUser.password == password) {
        currentUser.value = storedUser;
        isLoggedIn.value = true;
        return true;
      }
    }
    return false;
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
        "password_confirmation": cnfPassword
      };

      print(body);
      final res = await ApiService.post(ApiEndpoints.register, body);
      print("✅ REGISTER RESPONSE: ${res?.data}");
      print(res);
      if (res?.statusCode == 200 && res?.data['token'] != null) {
        await _storage.write(key: 'auth_token', value: res?.data['token']);
        await ApiService.setup();
        currentUser.value = UserModel.fromJson(res?.data['user']);
        isLoggedIn.value = true;
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  /// Clear stored data
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_data');
    currentUser.value = null;
    isLoggedIn.value = false;
  }
}
