import 'package:expense_tracker/widgets/expenses_list/expense_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Expenses extends StatefulWidget {
  Expenses({super.key});
  @override
  State<StatefulWidget> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter course',
        category: Category.work,
        amount: 19.99,
        date: DateTime.now()),
    Expense(
        title: 'Web Development',
        category: Category.work,
        amount: 10.00,
        date: DateTime.now()),
    Expense(
        title: 'Manchuria',
        category: Category.Food,
        amount: 10.00,
        date: DateTime.now()),
    Expense(
        title: 'Hyderabad',
        category: Category.travel,
        amount: 620.33,
        date: DateTime.now())
  ];

  void _showAddExpenseDialog() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return NewExpense();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FLutter Expense Tracker'),
        actions: [
          IconButton(onPressed: _showAddExpenseDialog, icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [Expanded(child: ExpenseList(expenses: _registeredExpenses))],
      ),
    );
  }
}
