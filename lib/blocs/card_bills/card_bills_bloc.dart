import 'package:flutter/material.dart';

import '../../services/repository/card_bills_repository.dart';
import 'card_bills_state_bloc.dart';

class CardBillsBloc extends ValueNotifier<CardBillsStateBloc> {
  final CardBillsRepository _creditAccountRepository;
  late final CardBillsSucessState _cardBillsSucessState = CardBillsSucessState(
    groupByDateModel: [],
    currentCard: CurrentCard.others,
  );

  CardBillsBloc({required creditAccountRepository})
      : _creditAccountRepository = creditAccountRepository,
        super(CardBillsInitialState());

  Future<void> fetch({required String cardId, required CurrentCard currentCard}) async {
    if (value is CardBillsSucessState) {
      _cardBillsSucessState.currentCard = currentCard;

      if (_blueCardIsNotEmpty(currentCard)) {
        notifyListeners();
        return;
      }

      if (_greenCardIsNotEmpty(currentCard)) {
        notifyListeners();
        return;
      }
    }

    _internalFetch(cardId: cardId, currentCard: currentCard);
  }

  _internalFetch({required String cardId, required CurrentCard currentCard}) async {
    value = CardBillsLoadingState();
    try {
      _cardBillsSucessState.currentCard = currentCard;
      _cardBillsSucessState.groupByDateModel = await _creditAccountRepository.fetch(cardId: cardId);

      value = _cardBillsSucessState;
    } catch (e) {
      value = CardBillsErrorState(message: e.toString());
    }
  }

  bool _blueCardIsNotEmpty(CurrentCard card) {
    return (card == CurrentCard.blue) && (_cardBillsSucessState.groupByDateCardBlueModel.isNotEmpty);
  }

  bool _greenCardIsNotEmpty(CurrentCard card) {
    return (card == CurrentCard.green) && (_cardBillsSucessState.groupByDateCardGreenModel.isNotEmpty);
  }

  Future<void> refresh() async {
    if (value is CardBillsSucessState) {
      await _internalFetch(
        cardId: _cardBillsSucessState.groupByDateModel.first.cardId,
        currentCard: _cardBillsSucessState.currentCard,
      );
    }
  }
}
