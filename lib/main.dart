
import 'dart:math';
import 'package:expenses/components/chart.dart';
import 'package:flutter/material.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

main() {
  runApp(const ExpenseApp());
}

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({super.key});


  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();
    return MaterialApp(
      home: MyHomePage(),
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
        textTheme: tema.textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          labelLarge: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
          titleSmall: const TextStyle(
            color: Colors.white
          )
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold
          )
        )
      )
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   final List<Transaction> _transactions = [
      // Transaction(id: 't1', title: 'Novo tênis de corrida', value: 310.76, date: DateTime.now().subtract(const Duration(days: 5))),
      // Transaction(id: 't2', title: 'Conta de Luz', value: 211.30, date: DateTime.now().subtract(const Duration(days: 3))),
      // Transaction(id: 't2', title: 'Conta de Luz', value: 211.30, date: DateTime.now().subtract(const Duration(days: 4))),
      // Transaction(id: 't2', title: 'Conta de Luz', value: 211.30, date: DateTime.now().subtract(const Duration(days: 2))),
      // Transaction(id: 't2', title: 'Conta de Luz', value: 211.30, date: DateTime.now().subtract(const Duration(days: 3))),
      // Transaction(id: 't2', title: 'Conta de Luz', value: 211.30, date: DateTime.now().subtract(const Duration(days: 3))),
      // Transaction(id: 't3', title: 'Novo tênis de corrida', value: 310.76, date: DateTime.now().subtract(const Duration(days: 4))),
      // Transaction(id: 't4', title: 'Conta de Luz', value: 211.30, date: DateTime.now().subtract(const Duration(days: 5)))
  ];

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(context: context, builder: (_) {
      return TransactionForm((text, value, date) => _addTransaction(text, value, date));
    });
  }
  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7)
      ));
    }).toList();
  }
  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: date
    );
    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
              onPressed: () => _openTransactionFormModal(context),
              icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_transactions, _deleteTransaction)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
