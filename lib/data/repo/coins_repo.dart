import 'package:go_crypto/data/model/coins_response.dart';
import '../api_prodvider.dart';

class CoinsRepository {
  final _provider = ApiProvider();

  Future<CoinsResponse> fetchCoinsTopList() {
    return _provider.fetchTopCoinsData();
  }
}
