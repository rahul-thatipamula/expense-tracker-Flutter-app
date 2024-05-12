import 'package:expense_tracker/widgets/expenses.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList({super.key, required this.expenses});
  List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (cxt, item) => ExpenseItem(expenses[item]));
  }
}
