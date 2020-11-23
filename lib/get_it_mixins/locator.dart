import 'package:get_it/get_it.dart';
import 'package:smtutorial/get_it_mixins/drinks_notifier.dart';

// TODO 3: Add a locator for Get_it
final GetIt locator = GetIt.asNewInstance();

// TODO 4: Add a setup method and initialize the GetItDrinksNotifier
void setup() {
  locator.registerSingleton<GetItDrinksNotifier>(
    GetItDrinksNotifier(),
  );
}
