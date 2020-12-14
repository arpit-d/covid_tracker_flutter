import 'dart:convert';
import 'package:covid_tracker/models/covid_models.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future fetchCovidData() async {
    final response = await http.get("https://api.covid19india.org/data.json");
    if (response.statusCode == 200) {
      return CovidModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
