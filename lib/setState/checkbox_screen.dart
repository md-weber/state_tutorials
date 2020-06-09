import 'package:flutter/material.dart';

import '../constants.dart';

class Drink {
  String name;
  bool selected;

  Drink(this.name, this.selected);
}

// Widget
class CheckBoxScreen extends StatefulWidget {
  @override
  _CheckBoxScreenState createState() => _CheckBoxScreenState();
}

class _CheckBoxScreenState extends State<CheckBoxScreen> {
  List<Drink> drinks = [
    Drink("Water", false),
    Drink("Cuba Libre", false),
    Drink("Pina Colada", false),
    Drink("Havana Cola", false)
  ];

  @override
  Widget build(BuildContext context) {
    var selectedDrinks = drinks.where((element) => element.selected);

    return Scaffold(
      appBar: AppBar(
        title: Text("Cocktail Order"),
      ),
      body: Container(
        decoration: kMainBackgroundImage,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: kWhiteBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Drinks tonight",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  ...drinks
                      .map(
                        (drink) => DrinksWidget(
                          drink: drink,
                          onChanged: (value) {
                            setState(() {
                              drink.selected = value;
                            });
                          },
                        ),
                      )
                      .toList(),
                  Text(
                    "The order is: ",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => ListTile(
                        title: Text(
                          selectedDrinks.toList()[index].name,
                        ),
                      ),
                      itemCount: selectedDrinks.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
