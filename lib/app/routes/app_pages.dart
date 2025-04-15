// 📁 lib/routes/app_pages.dart
import 'package:cut2style/middlewares/role_middleware.dart';
import 'package:cut2style/views/auth/forgot_password_screen.dart';
import 'package:cut2style/views/auth/login_screen.dart';
import 'package:cut2style/views/auth/register_screen.dart';
import 'package:cut2style/views/dashboard/pro_dashboard.dart';
import 'package:cut2style/views/dashboard/user_dashboard.dart';
import 'package:cut2style/views/splash_screen.dart';
import 'package:cut2style/views/user_screens/ThemeSwitchWidget.dart';
import 'package:cut2style/views/user_screens/address/SavedAddressesScreen.dart';
import 'package:cut2style/views/user_screens/editprofile/EditProfileScreen.dart';
import 'package:cut2style/views/user_screens/orders/OrderHistoryScreen.dart';
import 'package:cut2style/views/user_screens/payment/PaymentMethodScreen.dart';
import 'package:cut2style/views/user_screens/refferals/QRReferralScreen.dart';
import 'package:cut2style/views/user_screens/user_support/user_support.dart';
import 'package:cut2style/views/user_screens/wishlist/WishlistScreen.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.initial,
      page: () => SplashScreen(),
      middlewares: [RoleMiddleware()],
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.userDashboard,
      page: () => const UserDashboard(),
      // middlewares: [RoleMiddleware()],
    ),
    GetPage(
      name: AppRoutes.proDashboard,
      page: () => const ProfessionalDashboard(),
      // middlewares: [RoleMiddleware()],
    ),

    // Placeholder for other routes
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterScreen(), // Replace with RegisterScreen
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => ForgotPasswordScreen(), // Replace with ForgotPasswordScreen
    ),

    GetPage(
      name: AppRoutes.editProfile,
      page: () => EditProfileScreen(), // Replace with ForgotPasswordScreen
    ),
    GetPage(
      name: AppRoutes.orderHistory,
      page: () => OrderHistoryScreen(), // Replace with ForgotPasswordScreen
    ),
    GetPage(
      name: AppRoutes.wishlist,
      page: () => WishlistScreen(), // Replace with ForgotPasswordScreen
    ),
    GetPage(
      name: AppRoutes.savedAddresses,
      page: () => SavedAddressesScreen(), // Replace with ForgotPasswordScreen
    ),
    GetPage(
      name: AppRoutes.themeSettings,
      page: () => ThemeSwitchWidget(), // Replace with ForgotPasswordScreen
    ),
    GetPage(
      name: AppRoutes.supportCenter,
      page: () => SupportScreen(), // Replace with ForgotPasswordScreen
    ),
    GetPage(
      name: AppRoutes.referralCode,
      page: () => QRReferralScreen(), // Replace with ForgotPasswordScreen
    ),
    GetPage(
      name: AppRoutes.paymentMethods,
      page: () => PaymentMethodScreen(), // Replace with ForgotPasswordScreen
    ),
  ];
}
