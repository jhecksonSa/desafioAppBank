class MyCardsModel {
  final String id;
  final double limit;
  final String name;
  final String number;
  final int bestShopDay;

  MyCardsModel({
    required this.id,
    required this.limit,
    required this.name,
    required this.number,
    required this.bestShopDay,
  });
}

class GroupByDateModel {
  final DateTime date;
  final String cardId;
  List<CardBillsModel> list;

  GroupByDateModel({
    required this.date,
    required this.cardId,
    required this.list,
  });
}

enum TypeShop { market, trip, mobile, others }

class CardBillsModel {
  final String shopName;
  final DateTime dateTime;
  final double payValue;
  final int? instalment;
  final String cardId;
  final TypeShop typeShop;

  CardBillsModel({
    required this.shopName,
    required this.dateTime,
    required this.payValue,
    this.instalment,
    required this.cardId,
    required this.typeShop,
  });
}
