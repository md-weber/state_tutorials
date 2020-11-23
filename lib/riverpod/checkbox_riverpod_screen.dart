import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smtutorial/riverpod/drinks_notifier.dart';
import 'package:smtutorial/widgets/drinks_widget.dart';

import '../constants.dart';

final drinksProvider = ChangeNotifierProvider((_) => DrinksNotifier());

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
              child: Consumer((context, read) {
                return Column(children: [
                  Text(
                    "Drinks tonight",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  ...read(drinksProvider)
                      .drinks
                      .map(
                        (drink) => DrinksWidget(
                          drink: drink,
                          onChanged: (bool value) {
                            drinksProvider
                                .read(context)
                                .selectDrink(drink, value);
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
                            drinksProvider
                                .read(context)
                                .selectedDrinks[index]
                                .name,
                          ),
                        );
                      },
                      itemCount: read(drinksProvider).selectedDrinks.length,
                    ),
                  ),
                ]);
              }),
            ),
          ),
        ),
      ),
    );
  }
}
