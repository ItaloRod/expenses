import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final void Function(DateTime) onDateChanged;

  const AdaptativeDatePicker(
      {required this.onDateChanged, required this.selectedDate, Key? key})
      : super(key: key);

  _showDatePicker(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate != null) {
        onDateChanged(pickedDate);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return !Platform.isAndroid
        ? Container(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              minimumDate: DateTime(2021),
              maximumDate: DateTime.now(),
              initialDateTime: DateTime.now(),
              onDateTimeChanged: onDateChanged,
            ),
          )
        : Container(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Text(selectedDate == null
                      ? 'Nenhuma data Selecionada!'
                      : 'Data selecionada: ${DateFormat('d/M/y').format(selectedDate)}'),
                ),
                TextButton(
                    onPressed: () => _showDatePicker(context),
                    child: Text(
                      'Selecionar Data',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          );
  }
}
