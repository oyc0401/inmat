class RecentModel {
  RecentModel({required this.id, required this.word, required this.date});

  final String id;
  final String word;
  final String date;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'word': word,
      'date': date,
    };
  }

  // 각 dog 정보를 보기 쉽도록 print 문을 사용하여 toString을 구현하세요
  @override
  String toString() {
    return 'Recent{id: $id, word: $word, date: $date}';
  }
}
