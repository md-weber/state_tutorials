import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smtutorial/models/drink.dart';
import 'package:smtutorial/riverpod/drink_state_notifier.dart';
import 'package:smtutorial/widgets/drinks_widget.dart';

import '../constants.dart';

final drinksProvider = StateNotifierProvider(
  (ref) => DrinkStateNotifier(
    [
      Drink("Water", false),
      Drink("Cuba Libre", false),
      Drink("Pina Colada", false),
      Drink("Havana Cola", false)
    ],
  ),
);

final selectedProvider = Provider<List<Drink>>(
  (ref) {
    return ref
        .watch(drinksProvider.state)
        .where((element) => element.selected)
        .toList();
  },
);

class CheckboxRiverpodScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    List<Drink> allDrinks = watch(drinksProvider.state);
    List<Drink> selectedDrinks = watch(selectedProvider);

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
              child: Column(children: [
                Text(
                  "Drinks tonight",
                  style: Theme.of(context).textTheme.headline4,
                ),
                for (final d in allDrinks)
                  DrinksWidget(
                    drink: Drink(d.name, d.selected),
                    onChanged: (bool value) {
                      context.read(drinksProvider).selectDrink(d, value);
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
                        title: Consumer(
                          builder: (context, watch, child) => Text(
                            watch(selectedProvider)[index].name,
                          ),
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
