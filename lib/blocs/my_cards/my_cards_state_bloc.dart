import '../../model/cards_model.dart';

abstract class MyCardsStateBloc {}

class MyCardInititalState extends MyCardsStateBloc {}

class MyCardLoadingState extends MyCardsStateBloc {}

class MyCardErrorState extends MyCardsStateBloc {
  final String message;
  final int? stausCode;

  MyCardErrorState({required this.message, this.stausCode});
}

class MyCardsSucessState extends MyCardsStateBloc {
  final List<MyCardsModel> _myCardsModel;

  MyCardsSucessState({required List<MyCardsModel> myCardsModel}) : _myCardsModel = myCardsModel;

  List<MyCardsModel> get myCardsModel => _myCardsModel;
}
