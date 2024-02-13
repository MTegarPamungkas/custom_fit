import 'package:flutter/material.dart';

class PaymentButtonCancel extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const PaymentButtonCancel(
      {super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 50,
            child: Stack(
              children: [
                Container(
                  height: 50,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFDF1919),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
