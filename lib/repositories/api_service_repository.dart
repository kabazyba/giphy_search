import 'dart:convert';

import 'package:giphy_search/services/api_service.dart';

class ApiServiceRepository {
  ApiService _apiService;

  ApiServiceRepository(String baseApiUrl) {
    _apiService = ApiService(baseUrl: baseApiUrl);
  }

  Future<String> fetchGiphy({Map<String, dynamic> headers, Map<String, dynamic> queryParameters}) async {
    final response =
        await _apiService.dioGet(ApiService.searchPath, addHeaders: headers, queryParameters: queryParameters);
    return jsonEncode(response.data);
  }
}
