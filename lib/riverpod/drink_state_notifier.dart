import 'package:smtutorial/models/drink.dart';
import 'package:state_notifier/state_notifier.dart';

class DrinkStateNotifier extends StateNotifier<List<Drink>> {
  DrinkStateNotifier(state) : super(state ?? []);

  void selectDrink(Drink drink, bool selected) {
    state = [
      for (final d in state)
        if (d.name == drink.name) Drink(d.name, selected) else d,
    ];
  }
}
