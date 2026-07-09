import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:syncday/Models/expense_model.dart';

class ExpenseController extends GetxController {
  final titleC = TextEditingController().obs;
  final amountC = TextEditingController().obs;
  final totalAmount = 0.0.obs;
  final expensesList = <ExpenseModel>[].obs;
  void addExpense() {
    final title = titleC.value.text.trim();
    final amountText = amountC.value.text.trim();
    if (title.isEmpty || amountText.isEmpty) return;
    final amount = double.tryParse(amountText);
    if (amount == null) return;
    final expense = ExpenseModel(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );
    expensesList.add(expense);
    addTotoal();
    titleC.value.clear();
    amountC.value.clear();
  }
  void addTotoal() {
    double sum = 0;

    for (var i in expensesList) {
      sum += i.amount;
    }
    totalAmount.value = sum;
  }
  @override
  void onClose() {
    titleC.value.dispose();
    amountC.value.dispose();
    super.onClose();
  }
}
