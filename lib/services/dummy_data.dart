import '../model/cards_model.dart';

final List<GroupByDateModel> groupByDateModel = [
  GroupByDateModel(
    date: DateTime.now(),
    cardId: '1923842UuU134',
    list: [
      CardBillsModel(
        cardId: '1923842UuU134',
        shopName: 'Apple',
        dateTime: DateTime.now(),
        payValue: 545.99,
        instalment: 12,
        typeShop: TypeShop.mobile,
      ),
      CardBillsModel(
        cardId: '1923842UuU134',
        shopName: 'Uber*Uber*Trip',
        dateTime: DateTime.now(),
        payValue: 12.96,
        typeShop: TypeShop.trip,
      ),
    ],
  ),
  GroupByDateModel(
    date: DateTime.now().subtract(
      const Duration(days: -20),
    ),
    cardId: '1923842UuU134',
    list: [
      CardBillsModel(
        cardId: '1923842UuU134',
        shopName: 'Carrefour',
        dateTime: DateTime.now(),
        payValue: 12.96,
        instalment: 3,
        typeShop: TypeShop.market,
      ),
    ],
  ),
  GroupByDateModel(
    date: DateTime.now().subtract(
      const Duration(days: -10),
    ),
    cardId: '492830922',
    list: [
      CardBillsModel(
        cardId: '492830922',
        shopName: 'Americanas',
        dateTime: DateTime.now(),
        payValue: 123.56,
        typeShop: TypeShop.market,
      ),
      CardBillsModel(
        cardId: '492830922',
        shopName: 'Auto Post',
        dateTime: DateTime.now(),
        typeShop: TypeShop.others,
        payValue: 198.96,
      ),
      CardBillsModel(
        cardId: '492830922',
        shopName: 'StarBucks',
        dateTime: DateTime.now(),
        payValue: 300.00,
        typeShop: TypeShop.others,
      ),
    ],
  )
];
