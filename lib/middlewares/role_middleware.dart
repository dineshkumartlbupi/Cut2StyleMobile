// middlewares/role_middleware.dart
import 'package:cut2style/app/routes/app_routes.dart';
import 'package:cut2style/core/constants/strings.dart';
import 'package:cut2style/services/AuthServicelocal.dart'; // local mock or actual service
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoleMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final user = AuthService.to.currentUser.value;
    final isLoggedIn = AuthService.to.isLoggedIn.value;

    print(" hii ${user?.role.toString()} && isLoggedIn $isLoggedIn");
    if (!isLoggedIn || user == null) {
      return const RouteSettings(name: AppRoutes.login);
    } else if (user.role == AppStrings.user) {
      return const RouteSettings(name: AppRoutes.userDashboard);
    } else if (user.role == AppStrings.vender) {
      return const RouteSettings(name: AppRoutes.proDashboard);
    }
    return null;
  }
}

