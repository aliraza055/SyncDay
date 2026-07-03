import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncday/Controllers/expense_controller.dart';
import 'package:syncday/constansts/app_colors.dart';
import 'package:syncday/constansts/app_textstyle.dart';

import 'package:syncday/widgets/app_bar.dart';
import 'package:syncday/widgets/app_button.dart';
import 'package:syncday/widgets/textfiled.dart';

import '../../widgets/expense_tile.dart';

class ExpenseScreen extends StatelessWidget {
  final exController = Get.put(ExpenseController());
  ExpenseScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(title: 'Expense Tracker'),
      body: SafeArea(
        top: false,
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.green, Colors.lightGreenAccent],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TOTAL SPENT',
                      style: AppTextStyles.overline.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Dummy value — bind to controller.totalSpent
                    Obx(() {
                      return Text(
                        '\RS ${exController.totalAmount.value}',
                        style: AppTextStyles.bigStat,
                      );
                    }),
                    const SizedBox(height: 6),
                    Text(
                      '3 transactions',
                      style: AppTextStyles.subtitle.copyWith(
                        color: Colors.white60,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              CustomTextField(
                hintText: 'Expense title',
                controller: exController.titleC.value,
              ),
              const SizedBox(height: 12),
              CustomTextField(
                controller: exController.amountC.value,
                hintText: 'Amount (e.g. 12.50)',
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 14),
              CustomButton(
                label: 'Add Expense',
                icon: Icons.add,
                onPressed: () {
                  exController.addExpense();
                },
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    itemCount: exController.expensesList.length,
                    itemBuilder: (context, index) {
                      var list = exController.expensesList[index];
                      return ExpenseTile(
                        title: list.title,
                        amount: list.amount,
                      );
                    },
                  );
                }),
              ),

              // const ExpenseTile(title: 'Lunch at Noma', amount: 24.50),
              // const ExpenseTile(title: 'Spotify Premium', amount: 9.99),
            ],
          ),
        ),
      ),
    );
  }
}
