import 'package:custom_fit/presentation/pages/payment/checkout_page.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key}) : super(key: key);

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
                  builder: (context) => const CheckoutPage(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF5D55B3), // Set your desired color
                borderRadius:
                    BorderRadius.circular(12.0), // Set your desired radius
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: SizedBox(
                  child: Text(
                    'Order Now',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white, // Set your desired text color
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
            color: const Color(0xFF5D55B3), // Set your desired color
            borderRadius:
                BorderRadius.circular(12.0), // Set your desired radius
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
