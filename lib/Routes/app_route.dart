import 'package:get/get.dart';
import 'package:syncday/Routes/app_pages.dart';
import 'package:syncday/Views/expense_screen.dart';
import 'package:syncday/Views/home_screen.dart';
import 'package:syncday/Views/task_screen.dart';
import 'package:syncday/Views/weather_screen.dart';

class AppRoute {
  AppRoute._();
  static final List<GetPage> pages = [
    GetPage(name: AppPages.home, page: () => const HomeScreen()),
    GetPage(name: AppPages.task, page: () => TaskScreen()),
    GetPage(name: AppPages.expense, page: () => ExpenseScreen()),
    GetPage(name: AppPages.weather, page: () => const WeatherScreen()),
  ];
}
