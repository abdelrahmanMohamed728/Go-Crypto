import 'package:dio/dio.dart';
import 'package:go_crypto/data/model/base_news_response.dart';
import 'package:go_crypto/data/model/coins_response.dart';
import 'package:go_crypto/res/constants.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _newsUrl = baseUrl + newsEndpoint;
  final String _topCoinsUrl = baseUrl + topListEndpoint;

  Future<BaseNewsResponse> fetchNewsData() async {
    try {
      Response response = await _dio.get(_newsUrl);
      return BaseNewsResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      throw Exception(error.toString());
    }
  }

  Future<CoinsResponse> fetchTopCoinsData() async {
    try {
      Response response = await _dio.get(_topCoinsUrl);
      return CoinsResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      throw Exception(error.toString());
    }
  }
}
