import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangugin/app/data/models/dictionary.dart';
import 'package:hangugin/extensions/num_extensions.dart';

class AudioCard extends StatefulWidget {
  final Dictionary word;

  const AudioCard(this.word, {super.key});

  @override
  State<AudioCard> createState() => _AudioCardState();
}

class _AudioCardState extends State<AudioCard> {
  final AssetsAudioPlayer _player = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Card(
        color: Theme.of(context).primaryColor,
        child: Padding(
            padding: EdgeInsets.all(2.0.sw),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  //mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: SelectableText(
                        widget.word.phraseKr,
                        style: Get.context?.textTheme.bodyLarge?.copyWith(
                            fontFamily: "NotoSansKR",
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .buttonTheme
                                .colorScheme
                                ?.onPrimary),
                      ),
                    ),
                    SelectableText(
                      widget.word.phraseEnUs.tr,
                      style: Get.context?.textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context)
                              .buttonTheme
                              .colorScheme
                              ?.onPrimary),
                    ),
                    _player.builderIsPlaying(builder: (context, playing) {
                      return TextButton(
                          onPressed: () {
                            if (playing) {
                              _player.stop();
                            } else {
                              try {
                                _player.open(
                                  Audio.network(
                                      "https://korean.mintybits.com/audio/${widget.word.phraseKr}.mp3"),
                                );
                              } catch (t) {
                                //mp3 unreachable
                                print(t);
                              }
                            }
                          },
                          child: Icon(
                              size: 24,
                              playing
                                  ? Icons.volume_up
                                  : Icons.volume_up_outlined,
                              color: Theme.of(context)
                                  .buttonTheme.colorScheme?.onPrimary));
                    })
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: SelectableText(
                        widget.word.sentenceKr,
                        style: Get.context?.textTheme.bodyLarge?.copyWith(
                          fontFamily: "NotoSansKR",
                          fontWeight: FontWeight.bold,
                            color: Theme.of(context).buttonTheme.colorScheme?.onPrimary
                        ),
                      ),
                    ),
                    _player.builderIsPlaying(builder: (context, playing) {
                      return TextButton(
                          onPressed: () {
                            if (playing) {
                              _player.stop();
                            } else {
                              try {
                                _player.open(
                                    Playlist(
                                        audios: [
                                          Audio.network(
                                              "https://korean.mintybits.com/audio/${Uri.encodeComponent(widget.word.sentenceKr)}.mp3", playSpeed: 1.0)
                                          ,
                                          Audio.network(
                                              "https://korean.mintybits.com/audio/${Uri.encodeComponent(widget.word.sentenceKr)}.mp3", playSpeed: 0.6)
                                          ,
                                        ]
                                    ),

                                );

                              } catch (t) {
                                //mp3 unreachable
                                print(t);
                              }
                            }
                          },
                          child: Icon(
                              size: 24,
                              playing
                                  ? Icons.volume_up
                                  : Icons.volume_up_outlined,
                              color: Theme.of(context)
                                  .buttonTheme.colorScheme?.onPrimary
                                  ));
                    })
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SelectableText(
                      widget.word.sentenceEnUs.tr,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).buttonTheme.colorScheme?.onPrimary,),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
