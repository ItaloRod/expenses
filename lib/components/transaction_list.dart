import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onDelete;

  const TransactionList(this.transactions, this.onDelete, {super.key});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (buildContext, boxConstraints) {
            return Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  height: boxConstraints.maxHeight * 0.2,
                  child: Text('Nenhuma Transação cadastrada',
                      style: Theme.of(context).textTheme.titleLarge),
                ),
                const SizedBox(height: 20),
                Container(
                  height: boxConstraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
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
                              style: Theme.of(context).textTheme.titleSmall),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(DateFormat('d MMM y').format(tr.date)),
                    trailing: MediaQuery.of(context).size.width > 400
                        ? TextButton.icon(
                            onPressed: () => onDelete(tr.id),
                            icon: Icon(
                              Icons.delete,
                              color: Theme.of(context).colorScheme.error,
                            ),
                            label: Text(
                              'Excluir',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.error),
                            ),
                          )
                        : IconButton(
                            onPressed: () => onDelete(tr.id),
                            icon: const Icon(Icons.delete),
                            color: Theme.of(context).colorScheme.error,
                          )),
              );
            });
  }
}
