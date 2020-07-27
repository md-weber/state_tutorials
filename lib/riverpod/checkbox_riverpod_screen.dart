import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smtutorial/models/drink.dart';
import 'package:smtutorial/riverpod/drinks_notifier.dart';
import 'package:smtutorial/widgets/drinks_widget.dart';

import '../constants.dart';

final drinksProvider = StateNotifierProvider(
  (ref) => DrinkList([
    Drink("Water", false),
    Drink("Cuba Libre", false),
    Drink("Pina Colada", false),
    Drink("Havana Cola", false)
  ]),
);

final allDrinks = Computed<List<Drink>>((read) {
  final drinks = read(drinksProvider.state);
  return drinks;
});

class CheckboxRiverpodScreen extends HookWidget {
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
              child: Consumer(
                (context, read) => Column(children: [
                  Text(
                    "Drinks tonight",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  for (final drink in read(allDrinks))
                    DrinksWidget(
                      drink: drink,
                      onChanged: (bool value) {
                        drinksProvider.read(context).selectDrink(drink, value);
                      },
                    ),
                  Text(
                    "The order is: ",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Consumer(
                          (context, read) => ListTile(
                            title: Text(
                              read(drinksProvider).selectedDrinks[index].name,
                            ),
                          ),
                        );
                      },
                      itemCount: read(drinksProvider).selectedDrinks.length,
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
