import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangugin/extensions/string_extensions.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.blue.shade50.withOpacity(0.4),
          BlendMode.dstATop,
        ),
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg.png'),
                    repeat: ImageRepeat.repeat))),
      ),
      Align(
          alignment: Alignment.center,
          child: LayoutBuilder(builder: (context, sizingInformation) {
            String imgName = "splash".nbod(context);

            return Image.asset(
              "assets/images/$imgName.png",
              fit: BoxFit.cover,
            );
          }))
    ]));
  }
}
