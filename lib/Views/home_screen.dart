import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncday/Controllers/expense_controller.dart';
import 'package:syncday/Controllers/home_controller.dart';
import 'package:syncday/Controllers/task_controller.dart';
import 'package:syncday/Routes/app_pages.dart';
import 'package:syncday/constansts/app_colors.dart';
import 'package:syncday/constansts/app_textstyle.dart';
import 'package:syncday/constansts/media_queries.dart';
import 'package:syncday/widgets/app_stats.dart';
import 'package:syncday/widgets/quick_acess.dart';
import 'package:syncday/widgets/wide_info.dart';

class HomeScreen extends StatelessWidget {
  final expenseC = Get.put(ExpenseController());
  final taskC = Get.put(TaskController());
  final homeC = Get.put(HomeController());
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: context.wp(0.05),
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text('DAILY MANAGER', style: AppTextStyles.overline),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(homeC.greeting, style: AppTextStyles.heading1),
                  const SizedBox(width: 8),
                  const Text('👋', style: TextStyle(fontSize: 24)),
                ],
              ),
              const SizedBox(height: 6),
              Text(homeC.formattedDate, style: AppTextStyles.subtitle),
              const SizedBox(height: 24), // Top stat row
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      label: 'Tasks left',
                      value: '${taskC.getPending}',
                    ),
                  ),
                  SizedBox(width: 12),
                  Obx(() {
                    return Expanded(
                      child: StatCard(
                        label: 'Spent today',
                        value: '\RS ${expenseC.totalAmount.value}',
                      ),
                    );
                  }),
                  SizedBox(width: 12),
                  Expanded(
                    child: StatCard(label: 'Weather', value: '68°'),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              Text('QUICK ACCESS', style: AppTextStyles.sectionLabel),
              const SizedBox(height: 14),

              // Quick access grid
              Row(
                children: [
                  Obx(
                    () => Expanded(
                      child: QuickAccessCard(
                        icon: Icons.check_box_outlined,
                        title: 'Task Manager',
                        subtitle: '${taskC.getPending} pending',
                        iconStartColor: AppColors.taskIconStart,
                        iconEndColor: AppColors.taskIconEnd,
                        onTap: () => Get.toNamed(AppPages.task),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Obx(
                    () => Expanded(
                      child: QuickAccessCard(
                        icon: Icons.account_balance_wallet_outlined,
                        title: 'Expenses',
                        subtitle: '\RS ${expenseC.totalAmount.value}',
                        iconStartColor: AppColors.expenseIconStart,
                        iconEndColor: AppColors.expenseIconStart,
                        onTap: () => Get.toNamed(AppPages.expense),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              WideInfoCard(
                icon: Icons.wb_sunny_outlined,
                title: 'Weather',
                subtitle: 'Partly Cloudy',
                iconStartColor: AppColors.weatherIconStart,
                iconEndColor: AppColors.weatherIconEnd,
                onTap: () => Get.toNamed(AppPages.weather),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
