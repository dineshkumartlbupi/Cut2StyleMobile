import 'package:cut2style/app/routes/app_routes.dart';
import 'package:cut2style/core/constants/strings.dart';
import 'package:cut2style/services/AuthServicelocal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '../services/auth_service.dart';

class AuthController extends GetxController {
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cnfpasswordController = TextEditingController();
  final storage = const FlutterSecureStorage();

  // Observables
  final role = ''.obs;
  final email = ''.obs;
  final dob = ''.obs;
  final name = ''.obs;
  final address = ''.obs;
  final gender = ''.obs;
  final password = ''.obs;
  final cnfPassword = ''.obs;

  Future<void> login() async {
    final success = await AuthService.to.login(email.value, password.value);
    if (success) {
      final role = AuthService.to.currentUser.value?.role;
      print(role);
      // Save login status in secure storage
      await storage.write(key: 'auth_token', value: "local_mock_token");
      if (role == AppStrings.user) {
        Get.offAllNamed(AppRoutes.userDashboard);
      } else if (role == AppStrings.vender) {
        Get.offAllNamed(AppRoutes.proDashboard);
      }
    } else {
      Get.snackbar("Login Failed", "Invalid email or password");
    }
  }

  Future<void> register() async {
    if (email.value.isEmpty || password.value.isEmpty) {
      Get.snackbar("Error", "Email and password cannot be empty");
      return;
    }

    final success = await AuthService.to.register(
        role.value,
        name.value,
        gender.value,
        dob.value,
        address.value,
        email.value,
        password.value,
        cnfPassword.value);
    if (success) {
      Get.snackbar("Success", "Registered Successfully. Please log in.");
      // Optional: Save user role securely
      await storage.write(key: 'auth_token', value: "local_mock_token");
      Get.offNamed(AppRoutes.login);
    } else {
      Get.snackbar("Error", "Registration failed");
    }
  }

  Future<void> logout() async {
    await storage.delete(key: 'auth_token');
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_data');
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
