import 'package:flutter/material.dart';

import '../../../blocs/my_cards/my_cards_bloc.dart';
import '../../../blocs/my_cards/my_cards_state_bloc.dart';
import '../../share/custom_divider.dart';
import 'bank_card_wiget.dart';

class CardsSectionWidget extends StatelessWidget implements PreferredSizeWidget {
  final MyCardsBloc myCardBloc;

  final double hight;
  final Function(int) cardChangeCallback;

  const CardsSectionWidget({
    super.key,
    required this.myCardBloc,
    required this.hight,
    required this.cardChangeCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<MyCardsStateBloc>(
      valueListenable: myCardBloc,
      builder: (contex, state, _) {
        if ((state is MyCardLoadingState) || (state is MyCardInititalState)) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is MyCardErrorState) {
          return Center(child: Text(state.message));
        }

        final MyCardsSucessState sucessState = (state as MyCardsSucessState);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomDivider(),
            Container(
              padding: const EdgeInsets.only(left: 18, top: 13.0, bottom: 16),
              width: double.infinity,
              height: hight + 13 + 16,
              child: PageView(
                onPageChanged: cardChangeCallback,
                scrollDirection: Axis.horizontal,
                padEnds: false,
                controller: PageController(viewportFraction: 0.93),
                children: [
                  BankCardWidget(
                    myCardsModel: (state).myCardsModel.first,
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF2B66BC),
                        Color(0xFF2B66BC),
                        Color(0xFF132D55),
                        Color(0xFF132D55),
                      ],
                    ),
                  ),
                  BankCardWidget(
                    myCardsModel: sucessState.myCardsModel.last,
                    showLine: false,
                    color: const Color(0xFF005153),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(hight);
}
