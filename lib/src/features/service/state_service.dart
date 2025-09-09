import 'package:dio/dio.dart';
import '../model/state_model.dart';


class StateService {
  static final Dio _dio = Dio();
  static Map<String, List<StateModel>> _cachedStates = {};

  static Future<Map<String, List<StateModel>>> _fetchAllCountriesStates() async {
    try {
      final response = await _dio.get(
          'https://countriesnow.space/api/v0.1/countries/states'
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final List<dynamic> countries = data['data'] ?? [];

        Map<String, List<StateModel>> countryStates = {};

        for (var country in countries) {
          final String countryCode = country['iso2'];
          if (countryCode.isEmpty) {
            continue;
          }
          final List<dynamic> states = country['states'] ?? [];
          final List<StateModel> stateModels = states.map<StateModel>((state) => StateModel.fromJson(state)).toList();

          countryStates[countryCode] = stateModels;
        }

        return countryStates;
      }
      return {};
    } catch (e) {
      print('Error fetching countries states: $e');
      return {};
    }
  }

  static Future<List<StateModel>> getStatesForCountry(String countryCode) async {
    try {
      // If we already have cached data, use it
      if (_cachedStates.isNotEmpty && _cachedStates.containsKey(countryCode)) {
        return _cachedStates[countryCode]!;
      }

      // Otherwise fetch all countries and cache them
      if (_cachedStates.isEmpty) {
        _cachedStates = await _fetchAllCountriesStates();
      }

      return _cachedStates[countryCode] ?? [];
    } catch (e) {
      print('Error getting states for $countryCode: $e');
      return [];
    }
  }

  static Future<Map<String, List<StateModel>>> getAllCountriesStates() async {
    if (_cachedStates.isEmpty) {
      _cachedStates = await _fetchAllCountriesStates();
    }
    return _cachedStates;
  }
}