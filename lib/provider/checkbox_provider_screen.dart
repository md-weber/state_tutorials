import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smtutorial/provider/drinks_provider.dart';
import 'package:smtutorial/widgets/drinks_widget.dart';

import '../constants.dart';

class CheckboxProviderScreen extends StatelessWidget {
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
              child: Consumer<DrinksProvider>(
                builder: (BuildContext context, DrinksProvider provider,
                    Widget child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Drinks tonight",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      ...provider.drinks
                          .map(
                            (drink) => DrinksWidget(
                              drink: drink,
                              onChanged: (value) {
                                provider.selectDrink(drink, value);
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
                              provider.selectedDrinks.toList()[index].name,
                            ),
                          ),
                          itemCount: provider.selectedDrinks.length,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
