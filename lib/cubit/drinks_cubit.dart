import 'package:cubit/cubit.dart';
import 'package:replay_cubit/replay_cubit.dart';
import 'package:smtutorial/models/drink.dart';

class DrinksCubit extends ReplayCubit<List<Drink>> {
  DrinksCubit()
      : super([
          Drink("Water", false),
          Drink("Cuba Libre", false),
          Drink("Pina Colada", false),
          Drink("Havana Cola", false)
        ]);

  void addDrink(Drink newDrink) => emit(state..add(newDrink));

  void removeDrink(Drink newDrink) {
    state.remove(newDrink);
    emit(state);
  }

  void selectDrink(Drink drink, bool selected) {
    var list = [...state];
    list.firstWhere((element) => element.name == drink.name).selected =
        selected;
    emit(list);
  }

  @override
  void onTransition(Transition<List<Drink>> transition) {
    print("Cubit itself: $transition");
    super.onTransition(transition);
  }
}
