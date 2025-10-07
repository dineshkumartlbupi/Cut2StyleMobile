// 3. EditProfileScreen.dart
import 'package:cut2style/controllers/auth_controller.dart';
import 'package:cut2style/core/constants/strings.dart';
import 'package:cut2style/widgets/app_dropdown.dart';
import 'package:cut2style/widgets/custom_button.dart';
import 'package:cut2style/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final controller = Get.put(AuthController());
  @override
  void initState() {
    super.initState();
    controller.loadUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Obx(() => CustomTextField(
                  label: AppStrings.name,
                  controller: controller.nameController,
                  onChanged: (val) => controller.name.value = val,
                  errorText: controller.nameError.value,
                )),
            const SizedBox(height: 16),
            Obx(() => AppDropdown(
                  value: controller
                      .role.value, //r Should be 'user' or 'professional'
                  options: [AppStrings.male, AppStrings.female],
                  onChanged: (val) => controller.gender.value = val ?? 'male',
                  labelText: 'Gender',
                  errorText: controller.genderError.value,
                )),
            const SizedBox(height: 20),
            Obx(() => CustomTextField(
                  label: AppStrings.dob,
                  controller: controller.dobController,
                  onChanged: (val) => controller.dob.value = val,
                  errorText: controller.dobError.value,
                )),
            const SizedBox(height: 20),
            Obx(() => CustomTextField(
                  label: AppStrings.email,
                  controller: controller.emailController,
                  onChanged: (val) => controller.email.value = val,
                  errorText: controller.emailError.value,
                )),
            const SizedBox(height: 20),
            CustomButton(
              text: AppStrings.updateProfile,
              onPressed: controller.updateProfile,
            ),
          ],
        ),
      ),
    );
  }
}
