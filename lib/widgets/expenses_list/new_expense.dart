import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  @override
  State<NewExpense> createState() {
    // TODO: implement createState
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {
  // var _enteredTitle = '';

  // void _inputTitle(String inputValue) {
  //   _enteredTitle = inputValue;
  // }

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
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
            decoration: InputDecoration(label: Text('Title')),
          ),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            maxLength: 50,
            decoration: InputDecoration(label: Text('Amount')),
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                  },
                  child: Text('Save btn'))
            ],
          )
        ],
      ),
    );
  }
}
