import 'package:flutter/material.dart';

class NewTransactions extends StatelessWidget {
  final Function addTx;
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  NewTransactions(this.addTx);

  void submitdata() {
    final enteredtitle = titlecontroller.text;
    final enteredamount = double.parse(amountcontroller.text);

    if (enteredtitle.isEmpty || enteredamount <= 0) {
      return;
    }

    addTx(
      titlecontroller.text,
      double.parse(amountcontroller.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              keyboardType: TextInputType.text,
              controller: titlecontroller,
              onSubmitted: (_) => submitdata()),
          TextField(
            decoration: InputDecoration(
              labelText: 'Amount',
            ),
            keyboardType: TextInputType.number,
            controller: amountcontroller,
            onSubmitted: (_) => submitdata(),
          ),
          FlatButton(
            child: Text(
              'Add Transaction',
              style: TextStyle(
                color: Colors.purple,
              ),
            ),
            onPressed: submitdata,
          )
        ]),
      ),
    );
  }
}
