import 'package:app2/chartbar.dart';
import 'package:app2/models/expens.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expense});
  final List<Expense> expense;
  List<ExpensesBuket> get buket {
    return [
      ExpensesBuket.forcategory(expense, Category.food),
      ExpensesBuket.forcategory(expense, Category.leisure),
      ExpensesBuket.forcategory(expense, Category.work),
      ExpensesBuket.forcategory(expense, Category.travel)
    ];
  }

  double get maximumchart {
    double maxchart = 0;
    for (final bukets in buket) {
      if (bukets.totalexpense > maxchart) {
        maxchart = bukets.totalexpense;
      }
    }
    return maxchart;
  }

  @override
  Widget build(BuildContext context) {
    final isdarkmode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.3),
              Theme.of(context).colorScheme.primary.withOpacity(0.0)
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          )),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                for (final buketss in buket)
                  ChartBar(
                      fill: buketss.totalexpense == 0
                          ? 0
                          : buketss.totalexpense / maximumchart),
              ],
            ),
          ),
          const SizedBox(
            height: 11,
          ),
          Row(
            children: buket
                .map((bucket) => Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Icon(
          categoryicon[bucket.category],
          color: isdarkmode
            ? Theme.of(context).colorScheme.secondary
             : Theme.of(context) .colorScheme.primary.withOpacity(0.7),
             // de 3shan el chart w 2lwan el icons hna 7sb dark or normal mode
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
  

