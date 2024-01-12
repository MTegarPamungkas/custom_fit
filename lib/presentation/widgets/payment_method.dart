import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            child: Text(
              'Payment',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: ShapeDecoration(
              color: Color(0xFFE2E0F1),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: Color(0xFF5D55B3),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 56,
                  height: 19,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/bni.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Icon(
                  Icons.check,
                  size: 24,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
