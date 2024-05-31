import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../blocs/card_bills/card_bills_bloc.dart';
import '../../blocs/card_bills/card_bills_state_bloc.dart';
import '../../blocs/my_cards/my_cards_bloc.dart';
import '../../blocs/my_cards/my_cards_state_bloc.dart';
import '../../services/datasource/my_cards_datasource.dart';
import '../../services/repository/my_cards_repository.dart';
import '../../utils/utils.dart';
import 'bills_section/bills_section_widget.dart';

import '../../services/datasource/card_bills_datasource.dart';
import '../../services/repository/card_bills_repository.dart';

import '../share/custom_navigation.dart';
import 'card_section/cards_section_widget.dart';
import 'favorites_section/favorites_section_widget.dart';
import '../share/custom_divider.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  CardBillsBloc cardBillsBloc = CardBillsBloc(
    creditAccountRepository: CardBillsRepository(
      httpContract: CardBillsDatasource(),
    ),
  );

  MyCardsBloc myCardsBloc = MyCardsBloc(
    myCardsRepository: MyCardsRepository(
      httpContract: MyCardsDatasource(),
    ),
  );

  @override
  void initState() {
    myCardsBloc.fetch().then((_) {
      if (myCardsBloc.value is MyCardsSucessState) {
        cardBillsBloc.fetch(
          cardId: (myCardsBloc.value as MyCardsSucessState).myCardsModel.first.id,
          currentCard: CurrentCard.blue,
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF346CBD), Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.centerLeft,
        ),
      ),
      child: RefreshIndicator(
        onRefresh: () => cardBillsBloc.refresh(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Center(
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(text: 'Olá, ', style: TextStyle(fontSize: 17, fontFamily: 'Mulish')),
                    TextSpan(
                      text: 'Cliente',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, fontFamily: 'Mulish'),
                    ),
                  ],
                ),
              ),
            ),
            leading: Center(
              child: SvgPicture.asset(
                fit: BoxFit.cover,
                '$pathImageAssets/menu.svg',
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: SvgPicture.asset('$pathImageAssets/chat2.svg'),
              ),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: SvgPicture.asset('$pathImageAssets/alert.svg'),
              )
            ],
            bottom: CardsSectionWidget(
              cardChangeCallback: (currentCard) {
                cardBillsBloc.fetch(
                  cardId: (myCardsBloc.value as MyCardsSucessState).myCardsModel[currentCard].id,
                  currentCard: CurrentCard.values[currentCard],
                );
              },
              myCardBloc: myCardsBloc,
              hight: (MediaQuery.sizeOf(context).height * 0.17),
            ),
          ),
          body: Column(
            children: [
              CustomDivider(),
              const FavoritesSectionWidget(),
              CustomDivider(),
              BillsSectionWidget(cardAccountBloc: cardBillsBloc),
            ],
          ),
          backgroundColor: Colors.transparent,
          bottomNavigationBar: const CustomNavigation(),
        ),
      ),
    );
  }
}
