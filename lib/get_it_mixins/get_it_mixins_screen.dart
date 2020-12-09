import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:smtutorial/get_it_mixins/drinks_notifier.dart';
import 'package:smtutorial/models/drink.dart';
import 'package:smtutorial/widgets/drinks_widget.dart';

import '../constants.dart';

// Widget
class GetItMixinsScreen extends StatelessWidget with GetItMixin {
  @override
  Widget build(BuildContext context) {
    final List<Drink> drinks = getX((GetItDrinksNotifier x) => x.drinks);
    final List<Drink> selectedDrinks =
        getX((GetItDrinksNotifier x) => x.selectedDrinks);

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
                            get<GetItDrinksNotifier>()
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
