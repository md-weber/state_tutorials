import 'package:cubit/cubit.dart';
import 'package:smtutorial/models/drink.dart';

// TODO 1: Create a class DrinksCubit and extend it with Cubit
// TODO 2: Initialize it with the first state

// TODO Optional: Override the onTransition Method to see how your cubit changes

class DrinksCubit extends Cubit<List<Drink>> {
  DrinksCubit()
      : super([
          Drink("Water", false),
          Drink("Cuba Libre", false),
          Drink("Pina Colada", false),
          Drink("Havana Cola", false)
        ]);

  void selectDrink(Drink drink, bool selected) {
    var list = [...state];
    list.firstWhere((element) => element.name == drink.name).selected =
        selected;
    emit(list);
  }
}
