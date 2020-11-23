import 'package:cubit/cubit.dart';

class MainCubitObserver extends CubitObserver {
  @override
  void onTransition(Cubit cubit, Transition transition) {
    print("CubitObserver $transition");
    super.onTransition(cubit, transition);
  }
}
