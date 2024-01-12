import 'package:custom_fit/presentation/pages/payment/payment_success.dart';
import 'package:custom_fit/presentation/widgets/auth_button.dart';
import 'package:custom_fit/presentation/widgets/card_item.dart';
import 'package:custom_fit/presentation/widgets/destination_adress.dart';
import 'package:custom_fit/presentation/widgets/payment_button.dart';
import 'package:custom_fit/presentation/widgets/payment_method.dart';
import 'package:custom_fit/presentation/widgets/shipping_option.dart';
import 'package:custom_fit/presentation/widgets/total_price.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CardItem(),
                const SizedBox(
                  height: 16,
                ),
                const DestinationAdress(),
                const SizedBox(
                  height: 16,
                ),
                const ShippingOption(),
                const SizedBox(
                  height: 16,
                ),
                const PaymentMethod(),
                const SizedBox(
                  height: 16,
                ),
                const TotalPrice(),
                const SizedBox(
                  height: 16,
                ),
                PaymentButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentSuccess(),
                        ),
                      );
                    },
                    title: "Make a Payment"),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
