import 'package:custom_fit/presentation/widgets/nav_order.dart';
import 'package:custom_fit/presentation/widgets/tab_order.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: NavOrder(),
          ),
          TabOrder()
        ],
      )),
    );
  }
}
