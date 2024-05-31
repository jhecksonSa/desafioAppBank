import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../model/cards_model.dart';
import '../../../../utils/utils.dart';
import '../../share/text_widget.dart';

class BankCardWidget extends StatelessWidget {
  final Gradient? gradient;
  final Color? color;
  final bool showLine;
  final MyCardsModel myCardsModel;

  BankCardWidget({
    super.key,
    this.gradient,
    this.color,
    this.showLine = true,
    required this.myCardsModel,
  });

  final ValueNotifier _eyeOpen = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
              gradient: gradient,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13, top: 13),
                  child: ValueListenableBuilder(
                    valueListenable: _eyeOpen,
                    builder: (context, value, _) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 16),
                                color: const Color(0xFFD9D9D9),
                                width: 88,
                                height: 56,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: _eyeOpen.value
                                        ? myCardsModel.number
                                        : myCardsModel.number.replaceRange(0, 3, '●●● '),
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                  TextWidget(
                                    text: myCardsModel.name,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () => _eyeOpen.value = !_eyeOpen.value,
                            icon: SvgPicture.asset(
                              width: 18,
                              height: 18,
                              _eyeOpen.value ? '$pathImageAssets/eye-on.svg' : '$pathImageAssets/eye-off.svg',
                              colorFilter: const ColorFilter.mode(
                                Color(0xFF09b6ff),
                                BlendMode.srcIn,
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: showLine
                        ? const LinearGradient(
                            colors: [
                              Color(0xFF132D55),
                              Color(0xFF132D55),
                              Color(0xFF2B66BC),
                              Color(0xFF2B66BC),
                              Color(0xFF2B66BC),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          )
                        : null,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(text: 'Limite disponível', fontSize: 8, color: Colors.white),
                      TextWidget(text: 'Melhor dia de compra', fontSize: 8, color: Colors.white)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13, bottom: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                          text: 'R\$ ${NumberFormat('###,###.00', 'pt_BR').format(myCardsModel.limit)}',
                          fontSize: 16,
                          color: Colors.white),
                      TextWidget(text: myCardsModel.bestShopDay.toString(), fontSize: 16, color: Colors.white)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
