import '../../model/cards_model.dart';
import '../contract/http_contract.dart';

class CardBillsRepository {
  HttpContract<List<GroupByDateModel>> httpContract;

  CardBillsRepository({
    required this.httpContract,
  });

  Future<List<GroupByDateModel>> fetch({required String cardId}) async {
    return await httpContract.fetch(params: [cardId]);
  }
}
