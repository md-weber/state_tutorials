import 'package:smtutorial/models/drink.dart';
import 'package:state_notifier/state_notifier.dart';

class DrinksNotifier extends StateNotifier<List<Drink>> {
  DrinksNotifier()
      : super([
          Drink("Water", false),
          Drink("Cuba Libre", false),
          Drink("Pina Colada", false),
          Drink("Havana Cola", false)
        ]);

  void addDrink(Drink newDrink) => state..add(newDrink);

  void removeDrink(Drink newDrink) => state..remove(newDrink);

  void selectDrink(Drink drink, bool selected) {
    List<Drink> list = state.map(
      (d) =>
          d.name == drink.name ? d.copyWith(selected: selected) : d.copyWith(),
    );
    state = list;
  }

  List<Drink> get selectedDrinks =>
      state.where((element) => element.selected).toList();

  List<Drink> get drinks => state;
}
