import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/utils.dart';

class CustomNavigation extends StatelessWidget {
  const CustomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
      ),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.11,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 0.0),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.only(topRight: Radius.circular(35), topLeft: Radius.circular(35)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(35.0), topRight: Radius.circular(35.0)),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            enableFeedback: false,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(icon: SvgPicture.asset('$pathImageAssets/home.svg'), label: 'Home'),
              BottomNavigationBarItem(icon: SvgPicture.asset('$pathImageAssets/file_text.svg'), label: 'Fatura'),
              BottomNavigationBarItem(icon: SvgPicture.asset('$pathImageAssets/bank_card.svg'), label: 'Cartão'),
              BottomNavigationBarItem(icon: SvgPicture.asset('$pathImageAssets/shop.svg'), label: 'Shop')
            ],
          ),
        ),
      ),
    );
  }
}
