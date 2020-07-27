import 'package:flutter/material.dart';
import 'package:smtutorial/models/drink.dart';
import 'package:smtutorial/widgets/drinks_widget.dart';

import '../constants.dart';

// TODO 4: Create a final variable with a StateNotifierProvider
// TODO 6: Initialize the DrinkStateNotifier with a List of drinks

// TODO 7: Initialize a allDrinks variable
// TODO 8: Use the Computed Method of Riverpod to read the state of drinksProvider

class CheckboxRiverpodScreen extends StatelessWidget {
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
              // TODO 9: Use the Riverpod Consumer
              child: Column(children: [
                Text(
                  "Drinks tonight",
                  style: Theme.of(context).textTheme.headline4,
                ),
                // TODO 10: Write a for loop to access all drinks via read of the computed function
                DrinksWidget(
                  drink: Drink("Replace", false),
                  onChanged: (bool value) {
                    // TODO 11: Access the drinksProvider.read and selectDrink
                  },
                ),
                Text(
                  "The order is: ",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                            // TODO 12: read drinksProvider and get the selectedDrinks
                            ""),
                      );
                    },
                    // TODO 13: use the read drinksProvider to receive the selectedDrinks
                    itemCount: 0,
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
