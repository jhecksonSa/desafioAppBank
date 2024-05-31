import '../../model/cards_model.dart';
import '../contract/http_contract.dart';

class MyCardsRepository {
  final HttpContract<List<MyCardsModel>> _httpContract;

  MyCardsRepository({required HttpContract<List<MyCardsModel>> httpContract}) : _httpContract = httpContract;

  Future<List<MyCardsModel>> fetch() async {
    return await _httpContract.fetch();
  }
}
