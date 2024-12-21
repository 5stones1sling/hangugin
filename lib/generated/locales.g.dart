// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

// ignore_for_file: lines_longer_than_80_chars
// ignore: avoid_classes_with_only_static_members
class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'zh_CN': Locales().zh_CN,
    'en_US': Locales().en_US,
  };
}

class LocaleKeys {
  LocaleKeys._();
  static const home_title = 'home_title';
}

class Locales {

  static final Locales _instance = Locales._internal();

  // Step 2: Private named constructor
  Locales._internal();

  // Step 3: Factory constructor that returns the same instance
  factory Locales() {
    return _instance;
  }
  Map<String, String> zh_CN = {
    'home_title': '学韩语',
  };
  Map<String, String> en_US = {
    'home_title': 'Learn Korean',
  };
}
