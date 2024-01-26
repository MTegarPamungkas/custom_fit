import 'package:custom_fit/presentation/pages/payment/checkout_page.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final int totalPrice;
  final String? data;
  const OrderItem({Key? key, required this.data, required this.totalPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutPage(
                    data: data,
                    totalPrice: totalPrice,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF5D55B3),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: SizedBox(
                  child: Text(
                    'Order Now',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF5D55B3),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SizedBox(
              child: Image.asset(
                "images/cart.png",
                color: Colors.white,
                width: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
