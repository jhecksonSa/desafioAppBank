import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:intl/intl.dart';

import '../../../../model/cards_model.dart';
import '../../../../utils/utils.dart';
import '../../share/custom_divider.dart';
import '../../share/text_widget.dart';

class BillsListTitleWidget extends StatelessWidget {
  final CardBillsModel cardAccountModel;
  const BillsListTitleWidget({
    super.key,
    required this.cardAccountModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 45.66,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Stack(children: [
                    Container(
                      margin: const EdgeInsets.only(right: 15.22),
                      width: 45.66,
                      height: 45.66,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Color.fromARGB(20, 229, 229, 229),
                      ),
                      child: Center(
                        child: switch (cardAccountModel.typeShop) {
                          TypeShop.market => SvgPicture.asset(
                              '$pathImageAssets/shopping.svg',
                            ),
                          TypeShop.mobile => SvgPicture.asset(
                              '$pathImageAssets/mobile.svg',
                            ),
                          TypeShop.trip => SvgPicture.asset(
                              '$pathImageAssets/car.svg',
                            ),
                          (_) => const Icon(
                              Icons.not_interested_rounded,
                              color: Color(0xFF346CBD),
                            ),
                        },
                      ),
                    ),
                    if (TypeShop.trip == cardAccountModel.typeShop)
                      const Positioned(
                        left: 30,
                        child: SizedBox(
                          width: 13,
                          height: 13,
                          child: Badge(
                            backgroundColor: Color(0xFFFFAC31),
                            label: Text(
                              '!',
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ),
                  ]),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: cardAccountModel.shopName, fontWeight: FontWeight.bold, fontSize: 12),
                      TextWidget(
                        text: DateFormat('dd/MM . hh:mm', 'pt_BR')
                            .format(
                              cardAccountModel.dateTime,
                            )
                            .replaceAll('.', 'às'),
                        fontSize: 10,
                      ),
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextWidget(
                      text: 'R\$ ${NumberFormat('###,###.00', 'pt_BR').format(cardAccountModel.payValue)}',
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                  if (cardAccountModel.instalment != null)
                    TextWidget(text: 'em x${cardAccountModel.instalment}', fontSize: 10),
                ],
              ),
            ],
          ),
        ),
        CustomDivider(
          paddingVertical: 9.0,
          color: const Color.fromARGB(70, 229, 229, 229),
        )
      ],
    );
  }
}
