import 'package:expense_app/models/expense.dart';
import 'package:expense_app/widgets/expenses_list/expenses_item_widget.dart';
import 'package:flutter/material.dart';

class ExpensesListWidget extends StatelessWidget {
  const ExpensesListWidget({super.key, required this.expenses});

  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => ExpensesItemWidget(
        expenses[index],
      ),
    );
  }
}
