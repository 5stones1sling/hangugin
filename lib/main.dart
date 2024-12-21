import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/data/providers/dictionary_provider.dart';
import 'app/modules/home/controllers/home_controller.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';


const FlexScheme APP_SCHEME = FlexScheme.blumineBlue;
const APP_FONTS = ["Ronoto", "NotoSansSC"];

void localLogWriter(String text, {bool isError = false}) {
  if (Get.isLogEnable) {
    print(text);
  }
}

var fontMap = {"en": "Roboto", "zh": "NotoSansSC"};

ThemeData _customizeLightTheme() {
  String languageCode = Get.locale?.languageCode ?? "en";

  String fontFamily = fontMap[languageCode] ?? "Roboto";

  var theme = FlexThemeData.light(
    scheme: APP_SCHEME,
    fontFamily: fontFamily,
    typography: Typography.material2021(),
  );

  TextTheme tt = theme.textTheme.apply(
      fontFamilyFallback: APP_FONTS);

  return theme.copyWith(textTheme: tt, textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.yellow,
    selectionColor: Colors.green,
    selectionHandleColor: Colors.green,
  ));
}

ThemeData _customizeDarkTheme() {
  String languageCode = Get.locale?.languageCode ?? "en";
  String fontFamily = fontMap[languageCode] ?? "Roboto";

  print("dark $languageCode $fontFamily");

  var theme = FlexThemeData.dark(
    scheme: APP_SCHEME,
    fontFamily: fontFamily,
    typography: Typography.material2021(),
  );

  TextTheme tt = theme.textTheme.apply(
      fontFamilyFallback: APP_FONTS);

  return theme.copyWith(textTheme: tt, textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.yellow,
    selectionColor: Colors.green,
    selectionHandleColor: Colors.green,
  ));
}

class MyGetApp extends StatelessWidget {
  const MyGetApp({super.key});



  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      logWriterCallback: localLogWriter,
      title: "Learn Korean",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      translationsKeys: AppTranslation.translations,
      locale: Get.deviceLocale, // translations will be displayed in that locale
      fallbackLocale: Locale('en',
          'US'), // specify the fallback locale in case an invalid locale is selected.
      binds: [
        Bind.lazyPut(
          () => HomeController(),
        ),
        Bind.lazyPut(
          () => DictionaryProvider(),
        )
      ],

      themeMode: ThemeMode.system,
      theme: _customizeLightTheme(),
      darkTheme: _customizeDarkTheme()

    );
  }
}

void main() {
  runApp(MyGetApp());
}
