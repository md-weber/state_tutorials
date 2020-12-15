import 'package:flutter/material.dart';
import 'package:smtutorial/widgets/drinks_widget.dart';

import '../constants.dart';

// TODO 6: Add the GetItMixin to the StatelessWidget
class GetItMixinScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final drinks = [];
    final selectedDrinks = [];
    // TODO 7: include drinks via watchOnly (https://pub.dev/packages/get_it_mixin#watching-data)
    // TODO 8: include selected drinks via watchOnly (https://pub.dev/packages/get_it_mixin#watching-data)
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
                            // TODO 9: Use get to access the ChangeNotifier and update the list of drinks
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
