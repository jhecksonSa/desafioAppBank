import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/utils.dart';
import 'favorites_icon_button_widget.dart';

class FavoritesSectionWidget extends StatelessWidget {
  const FavoritesSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Meus favoritos',
                style: TextStyle(fontSize: 14, color: Color(0xFF1A1A1A), fontWeight: FontWeight.bold),
              ),
              TextButton.icon(
                onPressed: () {},
                label: const Text(
                  'Personalizar',
                  style: TextStyle(fontSize: 8, color: Color(0xFF000000), fontWeight: FontWeight.bold),
                ),
                icon: SvgPicture.asset(
                  '$pathImageAssets/grid2.svg',
                ),
                iconAlignment: IconAlignment.end,
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 11),
            margin: const EdgeInsets.only(bottom: 20),
            height: 66,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                MyFavoritesIconButtonWidget(
                    label: 'Cartão virtual', onPressed: () {}, image: SvgPicture.asset('$pathImageAssets/gym.svg')),
                MyFavoritesIconButtonWidget(
                    label: 'Cartão adicional', onPressed: () {}, image: SvgPicture.asset('$pathImageAssets/gym-1.svg')),
                MyFavoritesIconButtonWidget(
                    label: 'Seguro', onPressed: () {}, image: SvgPicture.asset('$pathImageAssets/shield.svg')),
                MyFavoritesIconButtonWidget(
                    label: 'Pacote', onPressed: () {}, image: SvgPicture.asset('$pathImageAssets/sms.svg')),
                MyFavoritesIconButtonWidget(
                    label: 'Sala VIP',
                    onPressed: () {},
                    image: SvgPicture.asset('$pathImageAssets/road_sign_airport.svg')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
