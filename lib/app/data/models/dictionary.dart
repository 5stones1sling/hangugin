class Dictionary {
  Dictionary({
    required this.topicEnUs,
    required this.topicZhCn,
    required this.phraseKr,
    required this.sentenceKr,
    required this.phraseZhCn,
    required this.sentenceZhCn,
    required this.phraseEnUs,
    required this.sentenceEnUs,
  });

  final String topicEnUs;
  final String topicZhCn;
  final String phraseKr;
  final String sentenceKr;
  final String phraseZhCn;
  final String sentenceZhCn;
  final String phraseEnUs;
  final String sentenceEnUs;

  Dictionary copyWith({
    String? topicEnUs,
    String? topicZhCn,
    String? phraseKr,
    String? sentenceKr,
    String? phraseZhCn,
    String? sentenceZhCn,
    String? phraseEnUs,
    String? sentenceEnUs,
  }) {
    return Dictionary(
      topicEnUs: topicEnUs ?? this.topicEnUs,
      topicZhCn: topicZhCn ?? this.topicZhCn,
      phraseKr: phraseKr ?? this.phraseKr,
      sentenceKr: sentenceKr ?? this.sentenceKr,
      phraseZhCn: phraseZhCn ?? this.phraseZhCn,
      sentenceZhCn: sentenceZhCn ?? this.sentenceZhCn,
      phraseEnUs: phraseEnUs ?? this.phraseEnUs,
      sentenceEnUs: sentenceEnUs ?? this.sentenceEnUs,
    );
  }

  factory Dictionary.fromJson(Map<String, dynamic> json){
    return Dictionary(
      topicEnUs: json["topic_enUS"] ?? "",
      topicZhCn: json["topic_zhCN"] ?? "",
      phraseKr: json["Phrase_kr"] ?? "",
      sentenceKr: json["Sentence_kr"] ?? "",
      phraseZhCn: json["Phrase_zhCN"] ?? "",
      sentenceZhCn: json["Sentence_zhCN"] ?? "",
      phraseEnUs: json["Phrase_enUS"] ?? "",
      sentenceEnUs: json["Sentence_enUS"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "topic_enUS": topicEnUs,
    "topic_zhCN": topicZhCn,
    "Phrase_kr": phraseKr,
    "Sentence_kr": sentenceKr,
    "Phrase_zhCN": phraseZhCn,
    "Sentence_zhCN": sentenceZhCn,
    "Phrase_enUS": phraseEnUs,
    "Sentence_enUS": sentenceEnUs,
  };

  @override
  String toString(){
    return "$topicEnUs, $topicZhCn, $phraseKr, $sentenceKr, $phraseZhCn, $sentenceZhCn, $phraseEnUs, $sentenceEnUs, ";
  }


  static List<Dictionary> listFromJson(list) =>
      List<Dictionary>.from(list.map((x) => Dictionary.fromJson(x)));
}


