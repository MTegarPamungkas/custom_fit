import 'package:flutter/material.dart';

class NavHome extends StatelessWidget {
  const NavHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "images/search.png",
          width: 25,
        ),
        const SizedBox(
          width: 120,
          height: 23,
          child: Text(
            'Customfit',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Geometr415 Blk BT',
              fontWeight: FontWeight.w600,
              height: 0,
              letterSpacing: 1.28,
            ),
          ),
        ),
        Image.asset(
          "images/cart.png",
          width: 25,
        ),
      ],
    );
  }
}
