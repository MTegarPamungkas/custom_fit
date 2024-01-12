import 'package:flutter/material.dart';

class PriceItem extends StatelessWidget {
  const PriceItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 320,
      height: 22,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              child: Text(
                'Clothes to be paid for:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: 0.36,
                ),
              ),
            ),
          ),
          SizedBox(width: 142),
          Text(
            '\$25',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w700,
              height: 0,
              letterSpacing: 0.48,
            ),
          ),
        ],
      ),
    );
  }
}
