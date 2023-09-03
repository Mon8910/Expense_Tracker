import 'package:app2/widgets/expenses.dart';
import 'package:flutter/material.dart';
var kColor =ColorScheme.fromSeed(seedColor:const Color.fromARGB(255, 96, 59, 181),);
var kdarkcolor=ColorScheme.fromSeed(seedColor:const Color.fromARGB(255, 5, 99, 123)
,brightness: Brightness.dark,);


void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(useMaterial3: true,
      colorScheme: kdarkcolor,
      cardTheme: const CardTheme().copyWith(
              color: kdarkcolor.secondaryContainer,
              margin: const EdgeInsets.symmetric(vertical: 8,
              horizontal: 16),
              

            ), elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: kdarkcolor.primaryContainer,
                foregroundColor: kdarkcolor.onPrimaryContainer,
            ),
            ),
            
       
      ),
        theme: ThemeData()
            .copyWith(useMaterial3: true, 
            colorScheme: kColor,
            appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: kColor.onPrimaryContainer,
              foregroundColor: kColor.onPrimary
            ),
            cardTheme: const CardTheme().copyWith(
              color: kColor.secondaryContainer,
              margin: const EdgeInsets.symmetric(vertical: 8,
              horizontal: 16)

            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: kColor.primaryContainer,
            ),
            ),
            textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(fontWeight: FontWeight.normal,
              color: kColor.onSecondaryContainer,
              fontSize: 20
              )
            )
            ),
            
        home: const Expenses()),
  );
}
