class Words {
  int id;
  String word;
  int favourite;

  static String tableName="data";
  Words({this.id, this.word, this.favourite});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'word': word,
      'favourite': favourite,
    };
  }

  factory Words.fromJson(Map<String, dynamic> json) {
    return Words(
      id: json['id'],
      word: json['word'],
      favourite: json['favourite'],
    );
  }
}
