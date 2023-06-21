import 'package:expense_app/widgets/expenses_list_widget.dart';
import 'package:flutter/material.dart';
import 'models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter course',
      amount: 19.99,
      dateTime: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Flutter course',
      amount: 19.99,
      dateTime: DateTime.now(),
      category: Category.work,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
            child: ExpensesListWidget(
              expenses: _registeredExpenses,
            ),
          ),
        ],
      ),
    );
  }
}
