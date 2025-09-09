import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import '../model/country_model.dart';



class CountryService {
  static Future<List<CountryModel>> loadCountries() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data/locations.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => CountryModel.fromJson(json)).toList();
    } catch (e) {
      print('Error loading countries: $e');
      return [];
    }
  }

  static Future<List<CountryModel>> searchCountries(String query) async {
    final countries = await loadCountries();
    if (query.isEmpty) return countries;

    return countries.where((country) =>
    country.name.toLowerCase().contains(query.toLowerCase()) ||
        country.code.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }
}