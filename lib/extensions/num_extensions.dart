import 'package:get/get.dart';

extension NumExtensions on num {

  /// Returns the pecentage of screen height based on the extended number
  /// Example: 20.screenHeight = (20 / 100) * currentScreenHeight
  double get screenHeight => (this / 100) * (Get.context?.height ?? Get.height);

  /// Returns the pecentage of screen width based on the extended number
  /// Example: 20.screenHeight = (20 / 100) * currentScreenHeight
  double get screenWidth {  return (this / 100) * (Get.context?.width ?? Get.width);}

  /// Shorthand for [screenHeight]
  double get sh => screenHeight;

  /// Shorthand for [screenWidth]
  double get sw => screenWidth;

  ///
  ///  swminmax
  ///
  ///   Percentage of Screeen Width with a minimum number
  ///   and maximum number
  ///
  double swminmax(double min, double max) {
    return (sw < min) ? min : (sw > max ? max : sw);
  }


  ///
  ///  shminmax
  ///
  ///   Percentage of Screeen Width with a minimum number
  ///   and maximum number
  ///
  double shminmax(double min, double max) {
    return (sh < min) ? min : (sh > max ? max : sh);
  }
}