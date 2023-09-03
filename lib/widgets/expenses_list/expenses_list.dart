import 'package:app2/models/expens.dart';
import 'package:app2/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesLists extends StatelessWidget {
  const ExpensesLists({super.key, required this.expensess,required this.removedlist});
  final List<Expense> expensess;
  final void Function(Expense expense) removedlist;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: expensess.length,
    itemBuilder: (ctx,index) =>
     Dismissible(key: ValueKey(expensess[index]),
     background:Container(color: Theme.of(context).colorScheme.error,
     margin: EdgeInsets.symmetric(horizontal:Theme.of(context).cardTheme.margin!.horizontal ,vertical: Theme.of(context).cardTheme.margin!.vertical),) ,
     
     onDismissed: (direction) => removedlist(expensess[index]), 
     child: ExpenseItem(expensess[index]) ,));
  }
}
