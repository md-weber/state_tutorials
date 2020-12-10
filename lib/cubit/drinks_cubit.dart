// TODO Optional: Override the onTransition Method to see how your cubit changes

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smtutorial/models/drink.dart';

class DrinksCubit extends Cubit<List<Drink>> {
  DrinksCubit()
      : super(const [
          Drink("Water", false),
          Drink("Cuba Libre", false),
          Drink("Pina Colada", false),
          Drink("Havana Cola", false)
        ]);

  @override
  void onChange(Change<List<Drink>> change) {
    print("Cubit itself: $change");
    super.onChange(change);
  }

  void addDrink(Drink newDrink) => emit(state..add(newDrink));

  void removeDrink(Drink newDrink) => emit(state..remove(newDrink));

  void selectDrink(Drink drink, bool selected) {
    final List<Drink> list = state
        .map((d) => d.name == drink.name
            ? d.copyWith(selected: selected)
            : d.copyWith())
        .toList();
    emit(list);
  }

  List<Drink> get selectedDrinks =>
      state.where((element) => element.selected).toList();
}
