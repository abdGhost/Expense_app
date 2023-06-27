import 'package:expense_app/models/expense.dart';
import 'package:expense_app/widgets/expenses_list/expenses_item_widget.dart';
import 'package:flutter/material.dart';

class ExpensesListWidget extends StatelessWidget {
  const ExpensesListWidget({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final void Function(Expense expense) onRemoveExpense;

  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpensesItemWidget(
          expenses[index],
        ),
      ),
    );
  }
}
