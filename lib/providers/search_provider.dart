import 'package:flutter/material.dart';
import 'package:giphy_search/models/giphy_model.dart';
import 'package:giphy_search/network/response.dart';
import 'package:giphy_search/repositories/api_service_repository.dart';
import 'package:giphy_search/services/toast_servise.dart';

class SearchProvider extends ChangeNotifier {
  ApiServiceRepository _apiServiceRepository;

  SearchProvider(String baseApiUrl) {
    _apiServiceRepository = ApiServiceRepository(baseApiUrl);
  }

  Response<GiphyData> giphyListResponse = Response.none();

  List<Gif> giphyList = [];
  int totalCount;
  int offset;
  String question;

  Future<void> fetchGifList(String question) async {
    giphyListResponse = Response.loading('');
    notifyListeners();
    this.question = question;
    try {
      final response = await _apiServiceRepository.fetchGiphy(queryParameters: {'q': question});
      giphyListResponse = Response.completed(GiphyData.fromRawJson(response));
      giphyList = giphyListResponse.data.gifList;
      totalCount = giphyListResponse.data.pagination.totalCount;
      offset = giphyList.length;
      if (giphyList.isEmpty) {
        ToastService.showMessage(message: 'sorry we didn\'t find anything');
      }
      notifyListeners();
    } catch (e) {
      giphyListResponse = Response.error(e.toString());
      ToastService.showMessage(message: "Sorry something went wrong");
      notifyListeners();
    }
  }

  Future<void> additionalFetchGifList() async {
    giphyListResponse = Response.loading('');
    notifyListeners();
    try {
      final response = await _apiServiceRepository.fetchGiphy(queryParameters: {'q': question, 'offset': offset});
      giphyListResponse = Response.completed(GiphyData.fromRawJson(response));
      giphyList.addAll(giphyListResponse.data.gifList);
      offset = giphyList.length;
      notifyListeners();
    } catch (e) {
      giphyListResponse = Response.error(e.toString());
      ToastService.showMessage(message: "Sorry something went wrong");
      notifyListeners();
    }
  }

  Future<void> clearData() async {
    giphyList = [];
    totalCount = 0;
    offset = 0;
    question = '';
    notifyListeners();
  }
}
