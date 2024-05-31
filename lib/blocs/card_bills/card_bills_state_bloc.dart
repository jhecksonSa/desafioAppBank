import '../../model/cards_model.dart';

enum CurrentCard { blue, green, others }

abstract class CardBillsStateBloc {}

class CardBillsInitialState extends CardBillsStateBloc {}

class CardBillsLoadingState extends CardBillsStateBloc {}

class CardBillsErrorState extends CardBillsStateBloc {
  final String message;
  final int? satusCode;
  CardBillsErrorState({required this.message, this.satusCode});
}

class CardBillsSucessState extends CardBillsStateBloc {
  List<GroupByDateModel> _groupByDateCardBlueModel = [];
  List<GroupByDateModel> _groupByDateCardGreenModel = [];

  CurrentCard _currentCard = CurrentCard.others;

  CardBillsSucessState({required List<GroupByDateModel> groupByDateModel, required CurrentCard currentCard})
      : _currentCard = currentCard;

  List<GroupByDateModel> get groupByDateModel {
    if (_currentCard == CurrentCard.blue) {
      return _groupByDateCardBlueModel;
    }

    return _groupByDateCardGreenModel;
  }

  List<GroupByDateModel> get groupByDateCardBlueModel => _groupByDateCardBlueModel;
  List<GroupByDateModel> get groupByDateCardGreenModel => _groupByDateCardGreenModel;

  // ignore: unnecessary_getters_setters
  CurrentCard get currentCard => _currentCard;

  set currentCard(CurrentCard value) {
    _currentCard = value;
  }

  set groupByDateModel(List<GroupByDateModel> value) {
    if (_currentCard == CurrentCard.blue) {
      _groupByDateCardBlueModel = value;
      return;
    }

    _groupByDateCardGreenModel = value;
  }
}
