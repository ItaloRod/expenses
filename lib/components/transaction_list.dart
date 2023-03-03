import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  final void Function(String) onDelete;

  const TransactionList(this.transactions, this.onDelete, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 610,
      child: transactions.isEmpty ? Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Nenhuma Transação cadastrada',
            style: Theme.of(context).textTheme.titleLarge
        ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: Image.asset(
                'assets/images/waiting.png',
              fit: BoxFit.cover,
            ),
          )
      ],
      ) : ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final tr = transactions[index];
          return Card(
            elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: FittedBox(
                    child: Text('R\$ ${tr.value}',
                      style: Theme.of(context).textTheme.titleSmall
                    ),
                  ),
                ),
              ),
              title: Text(
                tr.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                DateFormat('d MMM y').format(tr.date)
              ),
              trailing: IconButton(
                onPressed: () => onDelete(tr.id),
                icon: const Icon(Icons.delete),
                color: Theme.of(context).colorScheme.error,
              )
            ),
          );
        }
      ),
    );
  }
}
