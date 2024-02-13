import 'package:flutter/material.dart';

class ShippingOptionDetail extends StatefulWidget {
  const ShippingOptionDetail({Key? key}) : super(key: key);

  @override
  State<ShippingOptionDetail> createState() => _ShippingOptionDetailState();
}

class _ShippingOptionDetailState extends State<ShippingOptionDetail> {
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
              'Shipping Options',
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
          buildSelectableOption(
            title: 'Priority Sewing',
            date: '07 January 2024 - 14 January 2024',
            description:
                'With priority sewing, clothes will be made quickly and sent straight away',
            originalPrice: '\$50',
            discountedPrice: '\$40',
            index: 0,
          ),
        ],
      ),
    );
  }

  Widget buildSelectableOption({
    required String title,
    required String date,
    required String description,
    required String originalPrice,
    required String discountedPrice,
    required int index,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: ShapeDecoration(
        color: const Color(0xFFF5F5FA),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 0,
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    date,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontSize: 12,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const SizedBox(
                width: 190,
                child: Text(
                  'With priority sewing, clothes will be made quickly and sent straight away',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                originalPrice,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF727272),
                  fontSize: 12,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.lineThrough,
                  height: 0,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                discountedPrice,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
