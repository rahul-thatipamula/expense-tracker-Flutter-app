import 'package:expense_tracker/widgets/chart/chart.dart';
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
        category: Category.food,
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
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpense(onExpenseAdd: _onAddExpense);
        });
  }

  void _onAddExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _onRemoveExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Expense Deleted'),
      duration: Duration(seconds: 3),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses added. Try adding one...'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = Expanded(
          child: ExpenseList(
        expenses: _registeredExpenses,
        onRemoveExpense: _onRemoveExpense,
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Expense Tracker'),
        actions: [
          IconButton(onPressed: _showAddExpenseDialog, icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [Chart(expenses: _registeredExpenses), mainContent],
      ),
    );
  }
}
