import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

extension StringExtensions on String {

  ///
  ///  nameBasedOnDevice
  ///    e.g. for "splash" -
  ///    if mobile - returns splash_vertical
  ///    else returns splash_horiontal
  ///
  String nbod(BuildContext context) {

    if (context.isPortrait) {
      return "${this}_vertical";
    }

    return "${this}_horizontal";
  }
}