import 'package:flutter/material.dart';
import 'package:smtutorial/widgets/drinks_widget.dart';

import '../constants.dart';

class CheckboxCubitScreen extends StatefulWidget {
  @override
  _CheckboxCubitScreenState createState() => _CheckboxCubitScreenState();
}

class _CheckboxCubitScreenState extends State<CheckboxCubitScreen> {
  var state = [];
  var selectedDrinks = [];

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
              // TODO 4: Use a CubitBuilder to get access to the current state
              child: Column(children: [
                Text(
                  "Drinks tonight",
                  style: Theme.of(context).textTheme.headline4,
                ),
                ...state
                    .map(
                      (drink) => DrinksWidget(
                        drink: drink,
                        onChanged: (bool value) {
                          // TODO 7: Execute the selectDrink function
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
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          // TODO 5.2: Show a sub selection of drinks that is selected
                          selectedDrinks.toList()[index].name,
                        ),
                      );
                    },
                    itemCount: selectedDrinks.length,
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
