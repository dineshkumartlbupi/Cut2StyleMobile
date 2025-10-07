import 'package:cut2style/app/routes/app_pages.dart';
import 'package:cut2style/app/routes/app_routes.dart';
import 'package:cut2style/app/themes/theme.dart';
import 'package:cut2style/core/error/error_handler.dart';
import 'package:cut2style/data/local/local_storage_service.dart';
import 'package:cut2style/providers/cart_provider.dart';
import 'package:cut2style/services/AuthServicelocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.init();
  await Get.putAsync(() => AuthService().init());
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CartProvider()),
    ],
    child: MyApp(), // Replace with your main app widget
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final ThemeController themeController = Get.put(ThemeController());
  @override
  void initState() {
    super.initState();
    ErrorHandler.setContext(context); // ✅ Set global error handler context here
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: appTheme,
      // themeMode:
      //     themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initial,
      getPages: AppPages.routes,
    );
  }
}
