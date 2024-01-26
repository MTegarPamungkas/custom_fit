import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_fit/domain/entities/clothes.dart';
import 'package:custom_fit/presentation/pages/payment/payment_success.dart';
import 'package:custom_fit/presentation/widgets/card_item.dart';
import 'package:custom_fit/presentation/widgets/destination_adress.dart';
import 'package:custom_fit/presentation/widgets/payment_button.dart';
import 'package:custom_fit/presentation/widgets/payment_method.dart';
import 'package:custom_fit/presentation/widgets/shipping_option.dart';
import 'package:custom_fit/presentation/widgets/total_price.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class CheckoutPage extends StatefulWidget {
  final int totalPrice;
  final String? data;
  const CheckoutPage({Key? key, required this.data, required this.totalPrice})
      : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String capitalizeFirstLetter(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }

  String generateNumbers() {
    var rng = new Random();
    String numbers = '';
    for (var i = 0; i < 6; i++) {
      numbers += rng.nextInt(10).toString();
    }
    return numbers;
  }

  Future<void> _savePaymentDetails() async {
    final box = GetStorage();
    final uid = box.read('userUid');
    final sizeItem = box.read('sizeItem');
    final materialItem = box.read('materialItem');
    final sewing = box.read('sewing');
    try {
      CollectionReference orderCollection = FirebaseFirestore.instance
          .collection("core")
          .doc("order")
          .collection(sewing);

      String orderNumber = generateNumbers();

      DocumentReference orderDoc = orderCollection.doc(orderNumber);

      Map<String, dynamic> paymentDetails = {
        'orderNumber': orderNumber,
        'userId': uid,
        'item': widget.data,
        'timestamp': FieldValue.serverTimestamp(),
        'size': sizeItem,
        'material': materialItem,
        'status': 2,
        'sewing': sewing
      };

      await orderDoc.set(paymentDetails, SetOptions(merge: true));

      print('Payment details saved to Firestore');
    } catch (e) {
      print('Error saving payment details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Decode data
    List<dynamic> decodedData = jsonDecode(widget.data!);

    List<Clothes> clothesList =
        decodedData.map((item) => Clothes.fromMap(item)).toList();

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      capitalizeFirstLetter("Product"),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    Column(
                      children: clothesList.map((clothes) {
                        return CardItem(clothes: clothes);
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
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
                TotalPrice(
                  totalPrice: widget.totalPrice,
                ),
                const SizedBox(
                  height: 16,
                ),
                PaymentButton(
                    onPressed: () {
                      _savePaymentDetails();
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
