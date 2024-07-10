class HistoryData5 {
  String title;
  String date;
  String variable01;
  String variable02;
  String variable03;
  String variable04;
  String result;

  HistoryData5({
    required this.title,
    required this.date,
    required this.variable01,
    required this.variable02,
    required this.variable03,
    required this.variable04,
    required this.result,
  });

  // Factory method to create a User instance from a Map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': date,
      'variable01': variable01,
      'variable02': variable02,
      'variable03': variable03,
      'variable04': variable04,
      'result': result,
    };
  }

  // Method to convert the User instance to a Map
  factory HistoryData5.fromMap(Map<String, dynamic> map, String id) {
    return HistoryData5(
      title: map['title'] ?? '',
      date: map['date'] ?? '',
      variable01: map['variable01'] ?? '',
      variable02: map['variable02'] ?? '',
      variable03: map['variable03'] ?? '',
      variable04: map['variable04'] ?? '',
      result: map['result'] ?? '',
    );
  }
}
