class HistoryData3 {
  String title;
  String date;
  String variable01;
  String variable02;
  String variable03;
  String variable04;
  String variable05;
  String variable06;
  String variable07;
  String result;

  HistoryData3({
    required this.title,
    required this.date,
    required this.variable01,
    required this.variable02,
    required this.variable03,
    required this.variable04,
    required this.variable05,
    required this.variable06,
    required this.variable07,
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
      'variable05': variable05,
      'variable06': variable06,
      'variable07': variable07,
      'result': result,
    };
  }

  // Method to convert the User instance to a Map
  factory HistoryData3.fromMap(Map<String, dynamic> map, String id) {
    return HistoryData3(
      title: map['title'] ?? '',
      date: map['date'] ?? '',
      variable01: map['variable01'] ?? '',
      variable02: map['variable02'] ?? '',
      variable03: map['variable03'] ?? '',
      variable04: map['variable04'] ?? '',
      variable05: map['variable05'] ?? '',
      variable06: map['variable06'] ?? '',
      variable07: map['variable07'] ?? '',
      result: map['result'] ?? '',
    );
  }
}
