import 'dart:async';
import 'dart:math';

import '../../model/cards_model.dart';
import '../contract/http_contract.dart';
import '../dummy_data.dart';

class CardBillsDatasource extends HttpContract<List<GroupByDateModel>> {
  @override
  Future<List<GroupByDateModel>> fetch({List<String>? params}) {
    return Future.delayed(
      Duration(milliseconds: Random(100).nextInt(100) + 500),
      () => groupByDateModel.where((element) => element.cardId == params!.first).toList(),
    );
  }
}
