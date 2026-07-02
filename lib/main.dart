import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncday/Routes/app_pages.dart';
import 'package:syncday/Routes/app_route.dart';
import 'package:syncday/constansts/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DailyManagerApp());
}

class DailyManagerApp extends StatelessWidget {
  const DailyManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Daily Manager',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppPages.home,
      getPages: AppRoute.pages,
    );
  }
}
