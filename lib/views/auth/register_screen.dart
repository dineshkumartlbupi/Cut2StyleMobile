import 'dart:convert';

import 'package:cut2style/app/routes/app_routes.dart';
import 'package:cut2style/app/themes/app_text_styles.dart';
import 'package:cut2style/controllers/auth_controller.dart';
import 'package:cut2style/core/constants/colors.dart';
import 'package:cut2style/core/constants/strings.dart';
import 'package:cut2style/widgets/RoleSelector.dart';
import 'package:cut2style/widgets/app_dropdown.dart';
import 'package:cut2style/widgets/custom_button.dart';
import 'package:cut2style/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatelessWidget {
  final controller = Get.put(AuthController());

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(AppStrings.register),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Text(
                    "Are you ?",
                    style: AppTextStyle.headline1,
                  ),
                ),
                const SizedBox(height: 20),
                RoleSelector(
                  selected: controller.role.value,
                  options: [AppStrings.user, AppStrings.vender],
                  onChanged: (val) => controller.role.value = val,
                ),
                const SizedBox(height: 20),
                Container(
                  child: Text(
                    "Register to continue using BeePro Services",
                    style: AppTextStyle.headline1,
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: AppStrings.name,
                  controller: controller.nameController,
                  onChanged: (val) => controller.name.value = val,
                ),
                const SizedBox(height: 16),
                AppDropdown(
                  value: controller
                      .role.value, //r Should be 'user' or 'professional'
                  options: [AppStrings.male, AppStrings.female],
                  onChanged: (val) => controller.gender.value = val ?? 'male',
                  labelText: 'Gender',
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: AppStrings.dob,
                  controller: controller.dobController,
                  onChanged: (val) => controller.dob.value = val,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: AppStrings.email,
                  controller: controller.emailController,
                  onChanged: (val) => controller.email.value = val,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: AppStrings.password,
                  isPassword: true,
                  controller: controller.passwordController,
                  onChanged: (val) => controller.password.value = val,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: AppStrings.confirmpassword,
                  isPassword: true,
                  controller: controller.cnfpasswordController,
                  onChanged: (val) => controller.cnfPassword.value = val,
                ),
                const SizedBox(height: 30),
                CustomButton(
                    text: AppStrings.register, onPressed: controller.register),
                const SizedBox(height: 20),
                Center(
                  child: TextButton(
                    onPressed: () => Get.toNamed(AppRoutes.login),
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          const TextSpan(
                            text: "You have an already account? ",
                            style: TextStyle(color: Colors.black87),
                          ),
                          TextSpan(
                            text: AppStrings.login,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
