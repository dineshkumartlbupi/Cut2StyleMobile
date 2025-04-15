import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoaderUtil {
  static void showLoading([String message = 'Please wait...']) {
    if (!Get.isDialogOpen!) {
      Get.dialog(
        Material(
          type: MaterialType.transparency, // 🔹 Ensures no yellow underline
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(color: Colors.white),
                  const SizedBox(height: 16),
                  Text(
                    message,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false,
        barrierColor: Colors.black54,
      );
    }
  }

  static void hideLoading() {
    if (Get.isDialogOpen!) {
      Get.back(closeOverlays: true);
    }
  }
}
