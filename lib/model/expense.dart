import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//Uuid is a third party package.
const uuid = Uuid();

final formatDate = DateFormat.yMd();

enum Category { Food, travel, work, cloth }

final categoryIcon = {
  Category.Food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff_sharp,
  Category.work: Icons.work,
  Category.cloth: Icons.shopping_bag
};

class Expense {
  Expense(
      {required this.title,
      required this.category,
      required this.amount,
      required this.date})
      : id = uuid.v4(); //v4() generates a unique String

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatDate.format(date);
  }
}
