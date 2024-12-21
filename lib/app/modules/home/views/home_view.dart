import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangugin/app/data/models/dictionary.dart';
import 'package:hangugin/extensions/num_extensions.dart';
import 'package:hangugin/widgets/audio_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: controller.obx(
        (data) {
          return LayoutBuilder(builder: (context, x) {
            return Padding(
                padding: EdgeInsets.symmetric(vertical: 3 .sh, horizontal: 3.sw),
                child: SingleChildScrollView(
                    child: Obx(
                  () => Column(
                    children: [buildHeader(data), buildCards()],
                  ),
                )));
          });
        },
        onLoading: Center(child: CircularProgressIndicator()),
        onError: (error) => Center(
          child: Text(
            'Error: $error',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ));
  }

  Widget buildCards() {
    return Padding(
      padding: EdgeInsets.only(top: 4.sh),
      child: Wrap(
        children: [
          ...controller.getDictionaryWords().map((toElement) => GestureDetector(
            onTap: () {},
            child: AudioCard(toElement),
          ))
        ],
      )
    );
  }

  Align buildHeader(Map<String, List<Dictionary>> data) {
    return Align(
      alignment: Alignment.topCenter,
      child: Wrap(
        spacing: 2.sw,
        runSpacing: 2.sh,
        children: [
          ...data.keys.map(
            (key) => ChoiceChip(
              selected: controller.selectedTopic.value == key,
              side: BorderSide.none,
              onSelected: (selected) {
                controller.setSelectedTopic(key);
              },
              label: Text(key.tr, style: Get.context?.textTheme.labelMedium),
            ),
          )
        ],
      ),
    );
  }
}
