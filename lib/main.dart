import 'package:cut2style/app/routes/app_pages.dart';
import 'package:cut2style/app/routes/app_routes.dart';
import 'package:cut2style/app/themes/theme.dart';
import 'package:cut2style/core/error/error_handler.dart';
import 'package:cut2style/data/local/local_storage_service.dart';
import 'package:cut2style/services/AuthServicelocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.init();
  await Get.putAsync(() => AuthService().init());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    ErrorHandler.setContext(context); // ✅ Set global error handler context here
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initial,
      getPages: AppPages.routes,
    );
  }
}
