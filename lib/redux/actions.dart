import 'package:smtutorial/models/drink.dart';

// Actions: Actions are payloads of information that send data from your
// application to your store. They are the only source of information
// for the store. You send them to the store using store.dispatch().

// TODO 3: Create a UpdateDrinkAction with a payload "updatedDrink"

class UpdateDrinkAction {
  final Drink updatedDrink;

  UpdateDrinkAction(this.updatedDrink);
}
