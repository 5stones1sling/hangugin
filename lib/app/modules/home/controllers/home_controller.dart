import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';
import 'package:hangugin/app/data/models/dictionary.dart';
import 'package:hangugin/app/data/providers/dictionary_provider.dart';

class HomeController extends GetxController
    with StateMixin<Map<String, List<Dictionary>>> {
  //TODO: Implement HomeController

  final assetsAudioPlayer = AssetsAudioPlayer();
  final Map<String, List<Dictionary>> _data = {};
  var selectedTopic = "".obs;


  void setSelectedTopic(String topic) {
    selectedTopic.value = topic;
  }

  List<Dictionary> getDictionaryWords() {
    return _data[selectedTopic.value] ?? [];
  }

  Future<void> play(String url) async {
    try {

      await assetsAudioPlayer.open(
       Audio.network(url),
          //Audio.liveStream(url)
      );
    } catch (t) {
      //mp3 unreachable
      print(t);
    }
  }
  @override
  void onInit() {
    super.onInit();

    DictionaryProvider topicProvider = Get.find();
    topicProvider.getTopics().then((result) {
      List<Dictionary>? data = result.body;
      if (data != null) {
        Map<String, String> enUSMap = {};
        Map<String, String> zhCNMap = {};

        //build map to be added to the translations Map
        for (Dictionary t in data) {
          if (_data[t.topicEnUs] == null) {
            enUSMap[t.topicEnUs] = t.topicEnUs;
            zhCNMap[t.topicEnUs] = t.topicZhCn;
            enUSMap[t.phraseEnUs] = t.phraseEnUs;
            zhCNMap[t.phraseEnUs] = t.phraseZhCn;
            enUSMap[t.sentenceEnUs] = t.sentenceEnUs;
            zhCNMap[t.sentenceEnUs] = t.sentenceZhCn;
            _data[t.topicEnUs] = [t];
          } else {
            enUSMap[t.phraseEnUs] = t.phraseEnUs;
            zhCNMap[t.phraseEnUs] = t.phraseZhCn;
            enUSMap[t.sentenceEnUs] = t.sentenceEnUs;
            zhCNMap[t.sentenceEnUs] = t.sentenceZhCn;
            _data[t.topicEnUs]?.add(t);
          }
        }

        Map<String, Map<String, String>> tr = {};
        tr["en_US"] = enUSMap;
        tr["zh_CN"] = zhCNMap;

        Get.appendTranslations(tr);
        setSelectedTopic(_data.keys.first);
        setSuccess(_data);
      } else {
        setError("No Data");
      }
    }, onError: (err) {
      setError(err.toString());
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
