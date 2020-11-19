import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smtutorial/models/drink.dart';
import 'package:smtutorial/redux/actions.dart';
import 'package:smtutorial/widgets/drinks_widget.dart';

import '../constants.dart';

// Widget
class ReduxScreen extends StatelessWidget {
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
              child: StoreConnector<List<Drink>, List<Drink>>(
                converter: (store) => store.state,
                builder: (context, List<Drink> allDrinks) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Drinks tonight",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    ...allDrinks
                        .map(
                          (drink) => DrinksWidget(
                            drink: drink,
                            onChanged: (value) {
                              StoreProvider.of<List<Drink>>(context).dispatch(
                                UpdateDrinkAction(drink),
                              );
                            },
                          ),
                        )
                        .toList(),
                    Text(
                      "The order is: ",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    StoreConnector<List<Drink>, List<Drink>>(
                      converter: (store) => store.state
                          .where((element) => element.selected)
                          .toList(),
                      builder: (context, List<Drink> drinks) => Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) => ListTile(
                            title: Text(
                              drinks[index].name,
                            ),
                          ),
                          itemCount: drinks.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
