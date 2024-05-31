import 'package:flutter/material.dart';

import '../../services/repository/my_cards_repository.dart';
import 'my_cards_state_bloc.dart';

class MyCardsBloc extends ValueNotifier<MyCardsStateBloc> {
  final MyCardsRepository _myCardsRepository;

  MyCardsBloc({
    required myCardsRepository,
  })  : _myCardsRepository = myCardsRepository,
        super(MyCardInititalState());

  Future<void> fetch() async {
    if (value is MyCardsSucessState) {
      return;
    }

    value = MyCardLoadingState();
    try {
      value = MyCardsSucessState(myCardsModel: await _myCardsRepository.fetch());
    } catch (e) {
      value = MyCardErrorState(message: e.toString());
    }
  }
}
