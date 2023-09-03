import 'package:app2/chart.dart';
import 'package:app2/widgets/expenses_list/expenses_list.dart';
import 'package:app2/models/expens.dart';
import 'package:app2/widgets/expenses_new.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'meto market',
        amount: 20.12,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'flos sho8l',
        amount: 109,
        date: DateTime.now(),
        category: Category.work)
  ];

  void _ooenaddexpenseoverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) =>  ExpeneseNew(expensedata: _saveddata,),
    );
  }
  void _saveddata(Expense expense){
    setState(() {
      _registeredExpenses.add(expense);
    });

  }
  void _removedlist(Expense expense){
    final expenseindex=_registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('removed'),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(label: 'undo', 
      onPressed: (){
        setState(() {
          _registeredExpenses.insert(expenseindex, expense);
        });
      }
      ),
      ),);
  }

  @override
  Widget build(context) {
    Widget maincontent=const  Center( child: Text('no expense found,start adding some'));
    if(_registeredExpenses.isNotEmpty){
      maincontent=ExpensesLists(expensess: _registeredExpenses,removedlist: _removedlist,);
          
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("flutter expense tracker"),
        
        actions: [
          IconButton(
              onPressed: _ooenaddexpenseoverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Chart(expense: _registeredExpenses),
          Expanded(
            child: maincontent
          )
        ],
      ),
    );
  }
}
