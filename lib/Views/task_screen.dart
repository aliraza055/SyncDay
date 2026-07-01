import 'package:flutter/material.dart';
import 'package:syncday/constansts/app_colors.dart';
import 'package:syncday/constansts/app_textstyle.dart';
import 'package:syncday/constansts/media_queries.dart';

import 'package:syncday/widgets/app_bar.dart';
import 'package:syncday/widgets/app_button.dart';
import 'package:syncday/widgets/app_tile.dart';
import 'package:syncday/widgets/textfiled.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(title: 'Task Manager'),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: context.wp(0.05),
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextField(hintText: 'What needs to be done?'),
              const SizedBox(height: 14),
              CustomButton(
                label: 'Add Task',
                icon: Icons.add,
                onPressed: () {},
              ),
              const SizedBox(height: 24),

              // Dummy static list — replace with Obx(() => ListView...)
              const TaskTile(title: 'Review project proposal'),
              const TaskTile(title: 'Call dentist at 3pm', isChecked: true),
              const TaskTile(title: 'Buy groceries'),

              const SizedBox(height: 8),
              Center(
                child: Text('1 of 3 completed', style: AppTextStyles.subtitle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
