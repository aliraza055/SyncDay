import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncday/Controllers/task_controller.dart';
import 'package:syncday/constansts/app_colors.dart';
import 'package:syncday/constansts/app_textstyle.dart';
import 'package:syncday/constansts/media_queries.dart';

import 'package:syncday/widgets/app_bar.dart';
import 'package:syncday/widgets/app_button.dart';
import 'package:syncday/widgets/app_tile.dart';
import 'package:syncday/widgets/textfiled.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({super.key});
  final TaskController taskCon = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(title: 'Task Manager'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.wp(0.05),
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                controller: taskCon.taskContrller.value,
                hintText: 'What needs to be done?',
              ),
              const SizedBox(height: 14),

              /// ADD BUTTON
              CustomButton(
                label: 'Add Task',
                icon: Icons.add,
                onPressed: () {
                  final text = taskCon.taskContrller.value.text;
                  if (text.isNotEmpty) {
                    taskCon.addTask(text);
                    taskCon.taskContrller.value.clear();
                  } else {
                    print('Enter something please');
                  }
                },
              ),
              const SizedBox(height: 24),

              /// TASK LIST (ONLY THIS SCROLLS)
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    itemCount: taskCon.tasks.length,
                    itemBuilder: (context, index) {
                      final task = taskCon.tasks[index];
                      return TaskTile(
                        title: task.title, // correct usage
                        isChecked: task.isDone,
                        onToggle: () {
                          taskCon.toggleTask(index);
                        },
                        onDelete: () {
                          taskCon.deleteTask(index);
                        },
                      );
                    },
                  );
                }),
              ),

              /// FOOTER
              Center(
                child: Text('Task Manager', style: AppTextStyles.subtitle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
