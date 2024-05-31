import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:intl/intl.dart';

import '../../../../blocs/card_bills/card_bills_bloc.dart';
import '../../../../blocs/card_bills/card_bills_state_bloc.dart';
import '../../../../utils/utils.dart';
import '../../share/text_widget.dart';
import 'bills_list_title_widget.dart';

class BillsSectionWidget extends StatelessWidget {
  final CardBillsBloc cardAccountBloc;
  const BillsSectionWidget({
    super.key,
    required this.cardAccountBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Últimos lançamentos', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                TextButton.icon(
                  onPressed: () {},
                  label: const Text(
                    'Ver todos',
                    style: TextStyle(fontSize: 8, color: Color(0xFF000000), fontWeight: FontWeight.bold),
                  ),
                  icon: SvgPicture.asset('$pathImageAssets/arrow_right.svg'),
                  iconAlignment: IconAlignment.end,
                ),
              ],
            ),
          ),
          ValueListenableBuilder<CardBillsStateBloc>(
            valueListenable: cardAccountBloc,
            builder: (context, value, _) {
              if ((value is CardBillsInitialState) || (value is CardBillsLoadingState)) {
                return const Expanded(child: Center(child: CircularProgressIndicator()));
              }

              if (value is CardBillsErrorState) {
                return Center(child: Center(child: Text(value.message)));
              }

              final CardBillsSucessState sucessState = (value as CardBillsSucessState);

              return Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  shrinkWrap: true,
                  itemCount: sucessState.groupByDateModel.length,
                  itemBuilder: (context, indexGroupByDate) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 9.0),
                          child: TextWidget(
                              text: DateFormat('dd MMM', 'pt_BR')
                                  .format(
                                    sucessState.groupByDateModel[indexGroupByDate].date,
                                  )
                                  .captalization()
                                  .concatBefore(
                                      sucessState.groupByDateModel[indexGroupByDate].date.isSameDate(DateTime.now())
                                          ? 'Hoje, '
                                          : ''),
                              color: const Color(0xFF2890CF),
                              fontWeight: FontWeight.bold),
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: sucessState.groupByDateModel[indexGroupByDate].list.length,
                          itemBuilder: (context, index) => BillsListTitleWidget(
                            cardAccountModel: sucessState.groupByDateModel[indexGroupByDate].list[index],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
