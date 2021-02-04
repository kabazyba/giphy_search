import 'package:dio/dio.dart';
import 'package:giphy_search/network/exception.dart';


class ApiService{
  String baseApiUrl ;
  Dio dio;
  String locale;
  String giphyKey = '3Mj47TOSWIpdgjQ2OLi7Z6bMQMCrPkfi';


  static final ApiService _apiService = ApiService._internal();

  ApiService._internal();

  factory ApiService({baseUrl}) {
    var options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 10000,
      receiveTimeout: 10000,
    );

    _apiService.baseApiUrl = baseUrl;
    var dio = Dio(options);
    _apiService.dio = dio;
    return _apiService;
  }

  Map<String, String> headers = {'Content-type': 'application/json'};

  static const String searchPath = '/gifs/search';


  Future<Response> dioGet( url, {Map<String, String> addHeaders, Map<String, dynamic> queryParameters}) async {
    dynamic responseJson;

    var updatedQuery = {'api_key': giphyKey,'limit': 20};
    if(queryParameters!=null){
      updatedQuery.addAll(queryParameters);
    }
    Response response;
    try {
      response = await dio.get(baseApiUrl+url, queryParameters: updatedQuery, options: Options(headers: headers));
      responseJson = _dioResponse(response);
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.statusCode);
        throw e.response.data;
      } else {
        throw FetchDataException(e.error.toString());
      }
    }
    return responseJson;
  }


  dynamic _dioResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        final responseJson = response;
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw FetchDataException(response.toString());
      case 406:
        throw FetchDataException(response.toString());
      case 500:

      default:
        throw FetchDataException('Error occurred while Communication with Server with StatusCode : ${response}');
    }
  }
}