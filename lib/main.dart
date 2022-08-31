import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/new_transactions.dart';
import 'package:personal_expenses_app/widgets/transaction_list.dart';
import 'models/transaction.dart';

void main() {
  runApp(PE());
}

class PE extends StatefulWidget {
  @override
  _PEState createState() => _PEState();
}

class _PEState extends State<PE> {
  String _selectedItems = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();
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

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );
    setState(() {
      transaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: ListView(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Text('Charts'),
                ),
              ),
              TransactionList(transaction),
            ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showBottomSheet(
              context: context,
              builder: (context) {
                return ListView(
                  children: [
                    TextField(),
                    GestureDetector(
                      child: NewTransactions(_addNewTransaction),
                      behavior: HitTestBehavior.opaque,
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
