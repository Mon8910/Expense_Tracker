import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categoryicon = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work,
  Category.leisure: Icons.movie
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  String get formatedate {
    return formatter.format(date);
  }
}

class ExpensesBuket {
  ExpensesBuket({required this.expense, required this.category});
  ExpensesBuket.forcategory(List<Expense> allexpenses, this.category)
      : expense = allexpenses.where((expens) => expens.category == category).toList();

  final List<Expense> expense;
  final Category category;
  double get totalexpense {
    double sum = 0;
    for (final expenses in expense) {
      sum += expenses.amount;
    }
    return sum;
  }
}
