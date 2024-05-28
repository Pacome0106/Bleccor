class HistoryData1 {
  String title;
  String date;
  String variable01;
  String variable02;
  String result;

  HistoryData1({
    required this.title,
    required this.date,
    required this.variable01,
    required this.variable02,
    required this.result,
  });

  // Factory method to create a User instance from a Map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': date,
      'variable01': variable01,
      'variable02': variable02,
      'result': result,
    };
  }

  // Method to convert the User instance to a Map
  factory HistoryData1.fromMap(Map<String, dynamic> map, String id) {
    return HistoryData1(
      title: map['title'] ?? '',
      date: map['date'] ?? '',
      variable01: map['variable01'] ?? '',
      variable02: map['variable02'] ?? '',
      result: map['result'] ?? '',
    );
  }
}
