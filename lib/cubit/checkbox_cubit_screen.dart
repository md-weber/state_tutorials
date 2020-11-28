import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smtutorial/models/drink.dart';
import 'package:smtutorial/widgets/drinks_widget.dart';

import '../constants.dart';
import 'drinks_cubit.dart';

class CheckboxCubitScreen extends StatelessWidget {
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
              child: BlocBuilder<DrinksCubit, List<Drink>>(
                builder: (context, state) {
                  final selectedDrinks =
                      context.watch<DrinksCubit>().selectedDrinks;

                  return Column(children: [
                    Text("Drinks tonight",
                        style: Theme.of(context).textTheme.headline4),
                    ...state
                        .map(
                          (drink) => DrinksWidget(
                            drink: drink,
                            onChanged: (bool value) {
                              context
                                  .read<DrinksCubit>()
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
                              selectedDrinks.toList()[index].name,
                            ),
                          );
                        },
                        itemCount: selectedDrinks.length,
                      ),
                    ),
                  ]);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
