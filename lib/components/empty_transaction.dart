import 'package:flutter/material.dart';

class EmptyTransaction extends StatelessWidget {
  const EmptyTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (buildContext, boxConstraints) {
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
    });
  }
}
