import 'package:flutter/material.dart';
import 'package:smtutorial/models/drink.dart';

class DrinksWidget extends StatelessWidget {
  final Drink drink;
  final Function onChanged;

  const DrinksWidget({Key key, this.drink, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: drink.selected,
          onChanged: onChanged,
        ),
        Text(drink.name)
      ],
    );
  }
}
