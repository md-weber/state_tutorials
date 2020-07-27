// TODO 2: Create a [DrinkStateNotifier] class that extends [StateNotifier]
// TODO 3: Create the super notification
// TODO 4: Add the methods to select a Drink, get the selected drinks, get all drinks
import 'package:smtutorial/models/drink.dart';
import 'package:state_notifier/state_notifier.dart';

class DrinkStateNotifier extends StateNotifier<List<Drink>> {
  DrinkStateNotifier(List<Drink> state) : super(state);
}
