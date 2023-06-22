import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpensesItemWidget extends StatelessWidget {
  const ExpensesItemWidget(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        child: Column(
          children: [
            Text(
              expense.title,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(expense.formatedDate)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}