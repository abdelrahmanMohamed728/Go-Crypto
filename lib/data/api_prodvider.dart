import 'package:dio/dio.dart';
import 'package:go_crypto/data/model/base_news_response.dart';
import 'package:go_crypto/res/constants.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _newsUrl = baseUrl + newsEndpoint;

  Future<BaseNewsResponse> fetchNewsData() async {
    try {
      Response response = await _dio.get(_newsUrl);
      return BaseNewsResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      throw Exception(error.toString());
    }
  }
}
