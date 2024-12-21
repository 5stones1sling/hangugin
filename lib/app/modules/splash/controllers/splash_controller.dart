import 'dart:async';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  @override
  void onInit() {
    super.onInit();
    print("OnInit Splash Controller");
    Timer(Duration(seconds: 5),(){
      Get.offNamed(Routes.HOME);
    });
  }



}
