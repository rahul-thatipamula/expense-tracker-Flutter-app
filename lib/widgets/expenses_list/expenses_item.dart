import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

class ExpenseItem extends StatelessWidget {
  ExpenseItem(this.expense);
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(children: [
          Text(
            expense.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text('\$${expense.amount.toStringAsFixed(2)}'),
              const Spacer(),
              Row(
                children: [
                  Icon(categoryIcon[expense.category]),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(expense.formattedDate)
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
