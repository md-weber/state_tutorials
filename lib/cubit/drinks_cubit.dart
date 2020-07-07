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

  void addDrink(Drink newDrink) => emit(state..add(newDrink));

  void removeDrink(Drink newDrink) => emit(state..remove(newDrink));

  void selectDrink(Drink drink, bool selected) {
    List<Drink> list = state
        .map((d) => d.name == drink.name
            ? d.copyWith(selected: selected)
            : d.copyWith())
        .toList();
    emit(list);
  }

  // HotFix: Added after the video recording
  List<Drink> get selectedDrinks =>
      state.where((element) => element.selected).toList();

  @override
  void onTransition(Transition<List<Drink>> transition) {
    print("Cubit itself: $transition");
    super.onTransition(transition);
  }
}
