import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(
            () => SplashController(),
      )
    ];
  }
}
