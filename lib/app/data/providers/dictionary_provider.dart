import 'package:get/get_connect/connect.dart';

import '../models/dictionary.dart';

class DictionaryProvider extends GetConnect {
  @override
  void onInit() {
    // All request will pass to jsonEncode so CasesModel.fromJson()
    httpClient.defaultDecoder = Dictionary.listFromJson;
  }
  Future<Response<List<Dictionary>>> getTopics() => get<List<Dictionary>>(
      'https://opensheet.elk.sh/1dgctpGSBUsiSbJNzrfZ24LhjDXLCT7uFE7FhOy0hsi0/Dictionary'
  );

}