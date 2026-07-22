import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncday/Views/home_practice.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DailyManagerApp());
}

class DailyManagerApp extends StatelessWidget {
  const DailyManagerApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ProviderScope(child: MaterialApp(home: HomePractice()));
    // return GetMaterialApp(
    //   title: 'Daily Manager',
    //   debugShowCheckedModeBanner: false,
    //   theme: AppTheme.lightTheme,
    //   initialRoute: AppPages.home,
    //   getPages: AppRoute.pages,
    //   builder: (context, child) {
    //     return MediaQuery(
    //       data: MediaQuery.of(
    //         context,
    //       ).copyWith(textScaler: const TextScaler.linear(1.0)),
    //       child: child!,
    //     );
    //   },
    // );
  }
}
