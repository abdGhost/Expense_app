import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formtter = DateFormat.yMd();

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _NewExpensesState();
  }
}

class _NewExpensesState extends State<NewExpenses> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _pickDateTime() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1, now.month, now.day),
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLength: 20,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _selectedDate == null
                        ? "No Date Selected"
                        : formtter.format(_selectedDate!),
                  ),
                  IconButton(
                    onPressed: _pickDateTime,
                    icon: const Icon(
                      Icons.calendar_month,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                    print(_amountController.text);
                  },
                  child: const Text(
                    'Save Expense',
                  )),
            ],
          )
        ],
      ),
    );
  }
}
