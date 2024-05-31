import 'package:flutter/material.dart';

import '../../share/text_widget.dart';

class MyFavoritesIconButtonWidget extends StatelessWidget {
  final String label;
  final Widget image;
  final VoidCallback onPressed;

  const MyFavoritesIconButtonWidget({
    super.key,
    required this.label,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 35.0),
      child: Column(
        children: [
          SizedBox(
            width: 66,
            child: IconButton(
              style: IconButton.styleFrom(
                  backgroundColor: const Color.fromARGB(20, 229, 229, 229),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
              onPressed: onPressed,
              icon: image,
            ),
          ),
          TextWidget(text: label, fontSize: 10)
        ],
      ),
    );
  }
}
