import 'dart:ffi';

import 'package:flutter/material.dart';

class PriceItem extends StatefulWidget {
  final int totalPrice;
  const PriceItem({Key? key, required this.totalPrice}) : super(key: key);

  @override
  State<PriceItem> createState() => _PriceItemState();
}

class _PriceItemState extends State<PriceItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 22,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
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
          const SizedBox(width: 142),
          Text(
            'Rp.${widget.totalPrice}',
            style: const TextStyle(
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
