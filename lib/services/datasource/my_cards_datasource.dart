import '../../model/cards_model.dart';
import '../contract/http_contract.dart';

class MyCardsDatasource extends HttpContract<List<MyCardsModel>> {
  @override
  Future<List<MyCardsModel>> fetch({List<String>? params}) {
    return Future<List<MyCardsModel>>.delayed(
      const Duration(milliseconds: 50),
      () => [
        MyCardsModel(
          id: '1923842UuU134',
          limit: 7867.80,
          name: 'TI TEC',
          number: '32125621',
          bestShopDay: 20,
        ),
        MyCardsModel(
          id: '492830922',
          limit: 1232.80,
          name: 'TI TEC',
          number: '23425621',
          bestShopDay: 15,
        ),
      ],
    );
  }
}
