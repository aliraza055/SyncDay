import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:syncday/Routes/app_pages.dart';
import 'package:syncday/constansts/app_colors.dart';
import 'package:syncday/constansts/app_textstyle.dart';
import 'package:syncday/constansts/media_queries.dart';
import 'package:syncday/widgets/app_stats.dart';
import 'package:syncday/widgets/quick_acess.dart';
import 'package:syncday/widgets/wide_info.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
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
                  Text('Good Evening', style: AppTextStyles.heading1),
                  const SizedBox(width: 8),
                  const Text('👋', style: TextStyle(fontSize: 24)),
                ],
              ),
              const SizedBox(height: 6),
              Text('Tuesday, June 30', style: AppTextStyles.subtitle),

              const SizedBox(height: 24),

              // Top stat row
              Row(
                children: const [
                  Expanded(
                    child: StatCard(label: 'Tasks left', value: '2'),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: StatCard(label: 'Spent today', value: '\$48'),
                  ),
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
                  Expanded(
                    child: QuickAccessCard(
                      icon: Icons.check_box_outlined,
                      title: 'Task Manager',
                      subtitle: '2 pending',
                      iconStartColor: AppColors.taskIconStart,
                      iconEndColor: AppColors.taskIconEnd,
                      onTap: () => Get.toNamed(AppPages.task),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: QuickAccessCard(
                      icon: Icons.account_balance_wallet_outlined,
                      title: 'Expenses',
                      subtitle: '\$48.24 total',
                      iconStartColor: AppColors.expenseIconStart,
                      iconEndColor: AppColors.expenseIconStart,
                      onTap: () => Get.toNamed(AppPages.expense),
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
