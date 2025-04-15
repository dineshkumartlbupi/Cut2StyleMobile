// 4. ThemeSwitchWidget.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}

class ThemeSwitchWidget extends StatelessWidget {
  final ThemeController controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => SwitchListTile(
          title: const Text("Dark Mode"),
          value: controller.isDarkMode.value,
          onChanged: (val) => controller.toggleTheme(),
        ));
  }
}
