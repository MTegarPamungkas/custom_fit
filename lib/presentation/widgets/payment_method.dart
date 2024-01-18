import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int selectedOption = -1;

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
          Column(
            children: [
              buildSelectablePaymentMethod(
                imagePath: "images/bni.png",
                index: 0,
              ),
              const SizedBox(height: 20),
              buildSelectablePaymentMethod(
                imagePath: "images/bca.png",
                index: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSelectablePaymentMethod({
    required String imagePath,
    required int index, // Index of the payment method
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = index; // Update the selected payment method index
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: ShapeDecoration(
          color: selectedOption == index
              ? const Color(0xFFE2E0F1)
              : const Color(0xFFF5F5FA),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: selectedOption == index ? 2 : 0,
              color: selectedOption == index
                  ? const Color(0xFF5D55B3)
                  : Colors.transparent,
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
                  image: AssetImage(imagePath),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            if (selectedOption == index)
              const Icon(
                Icons.check,
                size: 24,
              )
          ],
        ),
      ),
    );
  }
}
