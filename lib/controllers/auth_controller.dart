import 'package:cut2style/app/routes/app_routes.dart';
import 'package:cut2style/core/constants/strings.dart';
import 'package:cut2style/core/error/snackbar_util.dart';
import 'package:cut2style/core/utils/field_validator.dart';
import 'package:cut2style/core/utils/loader_util.dart';
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
  final address = 'Your address'.obs;
  final gender = ''.obs;
  final password = ''.obs;
  final cnfPassword = ''.obs;

  // Error fields
  var roleError = RxnString();
  var nameError = RxnString();
  var dobError = RxnString();
  var emailError = RxnString();
  var passwordError = RxnString();
  var cnfPasswordError = RxnString();
  var genderError = RxnString();

  // Validation wrapper methods
  void validateUserType(String val) {
    role.value = val;
    roleError.value = FieldValidator.validateUserType(val);
  }

  void validateName(String val) {
    name.value = val;
    nameError.value = FieldValidator.validateName(val);
  }

  void validateDOB(String val) {
    dob.value = val;
    dobError.value = FieldValidator.validateDOB(val);
  }

  void validateEmail(String val) {
    email.value = val;
    emailError.value = FieldValidator.validateEmail(val);
  }

  void validatePassword(String val) {
    password.value = val;
    passwordError.value = FieldValidator.validatePassword(val);
    validateConfirmPassword(cnfPassword.value);
  }

  void validateConfirmPassword(String val) {
    cnfPassword.value = val;
    cnfPasswordError.value =
        FieldValidator.validateConfirmPassword(password.value, val);
  }

  void validateGender(String? val) {
    gender.value = val ?? '';
    genderError.value = FieldValidator.validateGender(val);
  }

  bool isFormValid() {
    validateUserType(role.value);
    validateName(name.value);
    validateDOB(dob.value);
    validateEmail(email.value);
    validatePassword(password.value);
    validateConfirmPassword(cnfPassword.value);
    validateGender(gender.value);
    return [
      nameError.value,
      dobError.value,
      emailError.value,
      passwordError.value,
      cnfPasswordError.value,
      genderError.value,
    ].every((e) => e == null);
  }

  bool isLoginFormValid() {
    validateEmail(email.value);
    validatePassword(password.value);
    return [
      emailError.value,
      passwordError.value,
    ].every((e) => e == null);
  }

  Future<void> login() async {
    if (!isLoginFormValid()) return;
    LoaderUtil.showLoading("Logging in...");
    final success = await AuthService.to.login(email.value, password.value);
    LoaderUtil.hideLoading();
    if (success) {
      final role = AuthService.to.currentUser.value?.role;
      if (role == AppStrings.user) {
        Get.offAllNamed(AppRoutes.userDashboard);
      } else if (role == AppStrings.vender) {
        Get.offAllNamed(AppRoutes.proDashboard);
      }
    } else {
      SnackbarUtil.showError("Invalid email or password");
    }
  }

  Future<void> register() async {
    if (!isFormValid()) return;
    LoaderUtil.showLoading("Loding please wait...");
    final success = await AuthService.to.register(
        role.value,
        name.value,
        gender.value,
        dob.value,
        address.value ?? "",
        email.value,
        password.value,
        cnfPassword.value);
    LoaderUtil.hideLoading();

    if (success) {
      LoaderUtil.hideLoading();
      SnackbarUtil.showSuccess("Registered Successfully. Please log in.");
      // Optional: Save user role securely
      await storage.write(key: 'auth_token', value: "local_mock_token");
      Get.offNamed(AppRoutes.login);
    } else {
      LoaderUtil.hideLoading();
      SnackbarUtil.showError("Registration failed");
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
