import 'package:flutter/material.dart';
import 'package:personal_expenses_app/transaction.dart';
import 'package:intl/intl.dart';

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
  String ntitle = '';
  String namount = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personal Expenses App'),
        ),
        body: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Text('Charts'),
                ),
              ),
              Card(
                elevation: 5.0,
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Title',
                          ),
                          onChanged: (val) => ntitle = val,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Amount',
                          ),
                          onChanged: (value) => namount = value,
                        ),
                        FlatButton(
                          child: Text(
                            'Add Transaction',
                            style: TextStyle(
                              color: Colors.purple,
                            ),
                          ),
                          onPressed: () {
                            print(ntitle);
                            print(namount);
                          },
                        )
                      ]),
                ),
              ),
              Column(
                children: transaction.map((tx) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.purple,
                            ),
                          ),
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            '\$' + tx.amount.toString(),
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tx.title,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                            Text(
                              DateFormat.yMMMd().format(tx.date),
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
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
