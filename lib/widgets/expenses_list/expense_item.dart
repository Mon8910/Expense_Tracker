import 'package:app2/models/expens.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget{
  const ExpenseItem(this.expenseitem,
  {super.key});
  final Expense expenseitem;
  @override
  Widget build(BuildContext context) {
   return Card(
    child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20
      ),
      child:Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(expenseitem.title,
        style: Theme.of(context).textTheme.titleLarge,),
        const SizedBox(height: 5,),
        Row(
          children: [
            Text('\$${expenseitem.amount.toStringAsFixed(2)}'),
            const Spacer(),
            Row(
              children: [
                  Icon(categoryicon[expenseitem.category]),
                  const SizedBox(
                  width:8 ,
                ),
                Text(expenseitem.formatedate)
              ],
            )

          ],
        )
      ],),
    ),
   ) ;
  }
}