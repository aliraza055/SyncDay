import 'package:get/get.dart';
import 'package:syncday/Routes/app_pages.dart';
import 'package:syncday/Views/expense_screen.dart';
import 'package:syncday/Views/home_screen.dart';
import 'package:syncday/Views/task_screen.dart';
import 'package:syncday/Views/weather_screen.dart';

/// GetX page list. Add `binding:` to each GetPage once you create
/// your controllers + bindings (e.g. binding: TaskBinding()).
class AppPages {
  AppPages._();

  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
    GetPage(name: AppRoutes.task, page: () => const TaskScreen()),
    GetPage(name: AppRoutes.expense, page: () => const ExpenseScreen()),
    GetPage(name: AppRoutes.weather, page: () => const WeatherScreen()),
  ];
}
