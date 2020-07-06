import 'package:cubit/cubit.dart';

// TODO Optional 2: Create a Observer and extend it from CubitObserver
// TODO Optional 3: Override the onTransition method
class MainCubitObserver extends CubitObserver {
  @override
  void onTransition(Cubit cubit, Transition transition) {
    print("CubitObserver $transition");
    super.onTransition(cubit, transition);
  }
}
