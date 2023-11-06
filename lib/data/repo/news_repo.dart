import 'package:go_crypto/data/model/base_news_response.dart';

import '../api_prodvider.dart';

class NewsRepository {


  final _provider = ApiProvider();

  Future<BaseNewsResponse> fetchNewsList() {
    return _provider.fetchNewsData();
  }
}
