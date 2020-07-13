import 'package:flutter/material.dart';

import '../constants.dart';

// TODO 2: Create a ChangeNotifierProvider that initializes
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
              // TODO 3: Use a Riverpod Consumer
              child: Column(children: [
                Text(
                  "Drinks tonight",
                  style: Theme.of(context).textTheme.headline4,
                ),
                // TODO 4: Receive the drinks from the provider and map it to a DrinksWidget
                // TODO 6: OnChanged of the DrinksWidget should call the selectDrink method
                Text(
                  "The order is: ",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                            // TODO 7: replace the empty string with the selectedDrinks getter method
                            ""),
                      );
                    },
                    // TODO 8: replace the 0 with the selectedDrinks length
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
