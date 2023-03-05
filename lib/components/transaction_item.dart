import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final void Function(String) onDelete;

  const TransactionItem({required this.transaction, required this.onDelete, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: Text('R\$ ${transaction.value}',
                    style: Theme.of(context).textTheme.titleSmall),
              ),
            ),
          ),
          title: Text(
            transaction.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(DateFormat('d MMM y').format(transaction.date)),
          trailing: MediaQuery.of(context).size.width > 400
              ? TextButton.icon(
                  onPressed: () => onDelete(transaction.id),
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  label: Text(
                    'Excluir',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.error),
                  ),
                )
              : IconButton(
                  onPressed: () => onDelete(transaction.id),
                  icon: const Icon(Icons.delete),
                  color: Theme.of(context).colorScheme.error,
                )),
    );
    ;
  }
}
