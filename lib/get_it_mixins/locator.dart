import 'package:get_it/get_it.dart';
import 'package:smtutorial/get_it_mixins/drinks_notifier.dart';

final GetIt locator = GetIt.instance;

void setup() {
  locator.registerSingleton<GetItDrinksNotifier>(
    GetItDrinksNotifier(),
  );
}
