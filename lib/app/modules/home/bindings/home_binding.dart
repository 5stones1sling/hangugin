import 'package:get/get.dart';
import '../../../data/providers/dictionary_provider.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(
            () => HomeController(),
      ),
      Bind.lazyPut(
            () => DictionaryProvider(),
      )
    ];
  }
}
