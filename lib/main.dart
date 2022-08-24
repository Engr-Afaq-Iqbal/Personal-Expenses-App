import 'package:flutter/material.dart';
import 'package:personal_expenses_app/transaction.dart';

void main() {
  runApp(PE());
}

class PE extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(
      id: 't1',
      title: 'Shoes',
      amount: 50.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Books',
      amount: 20.1,
      date: DateTime.now(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personal Expenses App'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Text('Charts'),
                ),
              ),
              Column(
                children: transaction.map((tx) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            tx.amount.toString(),
                          ),
                        ),
                        Column(
                          children: [
                            Text(tx.title),
                            Text(tx.date.toString()),
                          ],
                        )
                      ],
                    ),
                  );
                }).toList(),
              )
            ]),
      ),
    );
  }
}
