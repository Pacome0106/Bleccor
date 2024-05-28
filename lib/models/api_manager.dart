import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiManager {
  Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(
      Uri.parse('https://eppt.graciasgroup.com/api/transactions/stats/all'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return responseData;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
