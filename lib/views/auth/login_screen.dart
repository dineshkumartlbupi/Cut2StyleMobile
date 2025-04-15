import 'package:cut2style/app/routes/app_routes.dart';
import 'package:cut2style/controllers/auth_controller.dart';
import 'package:cut2style/core/constants/colors.dart';
import 'package:cut2style/core/constants/strings.dart';
import 'package:cut2style/widgets/custom_button.dart';
import 'package:cut2style/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final controller = Get.put(AuthController());
  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Image.asset(
                    "assets/images/logos.png",
                    height: 100,
                    width: 352,
                  )),
              const SizedBox(height: 20),
              Text("Welcome Back ",
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 10),
              Text("Login to continue using BeePro Services",
                  style: theme.textTheme.bodyLarge),
              const SizedBox(height: 40),
              Obx(() => CustomTextField(
                    label: AppStrings.email,
                    controller: controller.emailController,
                    onChanged: (val) => controller.email.value = val,
                    errorText: controller.emailError.value,
                  )),
              const SizedBox(height: 20),
              Obx(() => CustomTextField(
                    label: AppStrings.password,
                    controller: controller.passwordController,
                    isPassword: true,
                    onChanged: (val) => controller.password.value = val,
                    errorText: controller.emailError.value,
                  )),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Get.toNamed(AppRoutes.forgotPassword),
                  child: const Text('Forgot Password?'),
                ),
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: AppStrings.login,
                onPressed: controller.login,
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () => Get.toNamed(AppRoutes.register),
                  child: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        const TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(color: Colors.black87),
                        ),
                        TextSpan(
                          text: AppStrings.register,
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
    );
  }
}
