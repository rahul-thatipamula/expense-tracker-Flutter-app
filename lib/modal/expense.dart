import 'package:uuid/uuid.dart';

//Uuid is a third party package.
const uuid = Uuid();

enum Category { Food, travel, work, cloth }

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
}
