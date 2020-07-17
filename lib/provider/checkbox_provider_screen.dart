import 'package:flutter/material.dart';
import 'package:smtutorial/models/drink.dart';
import 'package:smtutorial/widgets/drinks_widget.dart';

import '../constants.dart';

class CheckboxProviderScreen extends StatefulWidget {
  @override
  _Checkbo⁄xProviderScreenState createState() => _CheckboxProviderScreenState();
}

class _CheckboxProviderScreenState extends State<CheckboxProviderScreen> {
  final List<Drink> drinks = [];
  @override
  Widget build(BuildContext context) {
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
              // TODO 7: Surround the Column with a Consumer widget
              // TODO 8: Implement the build function
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Drinks tonight",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  // TODO 9: Receive the drinks from the provider
                  ...drinks
                      .map(
                        (drink) => DrinksWidget(
                          drink: drink,
                          onChanged: (value) {
                            // TODO 11: call the selectDrink on the provider
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
                          // TODO 13.1: get the selectedDrinks from the provider
                          drinks
                              .where((element) => element.selected)
                              .toList()[index]
                              .name,
                        ),
                      ),
                      // TODO 13.2: get the selectedDrinks from the provider
                      itemCount:
                          drinks.where((element) => element.selected).length,
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
