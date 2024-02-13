import 'package:custom_fit/domain/entities/clothes.dart';
import 'package:custom_fit/presentation/pages/payment/payment_success.dart';
import 'package:custom_fit/presentation/widgets/card_item.dart';
import 'package:custom_fit/presentation/widgets/destination_adress.dart';
import 'package:custom_fit/presentation/widgets/order_number.dart';
import 'package:custom_fit/presentation/widgets/payment_button_cancel.dart';
import 'package:custom_fit/presentation/widgets/payment_method_detail.dart';
import 'package:custom_fit/presentation/widgets/shipping_option_detail.dart';
import 'package:custom_fit/presentation/widgets/total_price.dart';
import 'package:flutter/material.dart';

class DetailOrderPage extends StatelessWidget {
  const DetailOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Order"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CardItem(
                    clothes:
                        Clothes(id: "0", idModel: "0", img: "0", desc: "0")),
                const SizedBox(
                  height: 16,
                ),
                const DestinationAdress(),
                const SizedBox(
                  height: 16,
                ),
                const ShippingOptionDetail(),
                const SizedBox(
                  height: 16,
                ),
                const PaymentMethodDetail(),
                const SizedBox(
                  height: 16,
                ),
                const OrderNumber(),
                const SizedBox(
                  height: 16,
                ),
                const TotalPrice(
                  totalPrice: 0,
                ),
                const SizedBox(
                  height: 16,
                ),
                PaymentButtonCancel(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentSuccess(),
                        ),
                      );
                    },
                    title: "Cancel Order"),
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
