import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:smtutorial/cubit/drinks_cubit.dart';
import 'package:smtutorial/models/drink.dart';
import 'package:smtutorial/widgets/drinks_widget.dart';

import '../constants.dart';

class CheckboxCubitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cocktail Order"),
        actions: <Widget>[
          CubitBuilder<DrinksCubit, List<Drink>>(
            builder: (BuildContext context, state) {
              final cubit = context.cubit<DrinksCubit>();
              return IconButton(
                  icon: Icon(Icons.skip_previous),
                  disabledColor: Colors.green,
                  onPressed: () {
                    cubit.canUndo ? cubit.undo() : print("nope");
                  });
            },
          ),
          CubitBuilder<DrinksCubit, List<Drink>>(
            builder: (BuildContext context, state) {
              final cubit = context.cubit<DrinksCubit>();
              return IconButton(
                disabledColor: Colors.green,
                icon: Icon(Icons.skip_next),
                onPressed: () {
                  cubit.canRedo ? cubit.redo() : print("nope");
                },
              );
            },
          )
        ],
      ),
      body: Container(
        decoration: kMainBackgroundImage,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: kWhiteBackground,
              child: CubitBuilder<DrinksCubit, List<Drink>>(
                builder: (BuildContext context, List<Drink> state) {
                  print("CubitBuilder");
                  state.forEach((element) {
                    print("${element.name} ${element.selected}");
                  });
                  var selectedDrinks =
                      state.where((element) => element.selected);
                  return Column(children: [
                    Text(
                      "Drinks tonight",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    ...state
                        .map(
                          (drink) => DrinksWidget(
                            drink: drink,
                            onChanged: (bool value) {
                              context
                                  .cubit<DrinksCubit>()
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
