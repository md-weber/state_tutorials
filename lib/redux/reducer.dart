import 'package:smtutorial/models/drink.dart';
import 'package:smtutorial/redux/actions.dart';

List<Drink> updateDrinksReducer(List<Drink> state, dynamic action) {
  if (action is UpdateDrinkAction) {
    action.updatedDrink.selected = !action.updatedDrink.selected;
    return state
        .map(
          (drink) => drink.name == action.updatedDrink.name
              ? action.updatedDrink
              : drink,
        )
        .toList();
  }

  return state;
}
