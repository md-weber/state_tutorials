import 'package:cubit/cubit.dart';
import 'package:replay_cubit/replay_cubit.dart';
import 'package:smtutorial/models/drink.dart';

class DrinksCubit extends ReplayCubit<List<Drink>> {
  DrinksCubit()
      : super(const <Drink>[
          Drink("Water", false),
          Drink("Cuba Libre", false),
          Drink("Pina Colada", false),
          Drink("Havana Cola", false)
        ]);

  void addDrink(Drink newDrink) => emit(List.from(state)..add(newDrink));
  void removeDrink(Drink newDrink) => emit(List.from(state)..remove(newDrink));

  void selectDrink(Drink drink, bool selected) {
    var list = state.map((d) {
      return d.name == drink.name
          ? d.copyWith(selected: selected)
          : d.copyWith();
    }).toList();
    emit(list);
  }

  @override
  void onTransition(Transition<List<Drink>> transition) {
    print("Cubit itself: $transition");
    super.onTransition(transition);
  }
}
