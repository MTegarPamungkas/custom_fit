import 'package:custom_fit/presentation/widgets/draggable_sheet.dart';
import 'package:custom_fit/presentation/widgets/nav_custom_fit.dart';
import 'package:flutter/material.dart';

class CustomFitResult extends StatefulWidget {
  final String imageGenerated;
  final String? data;
  final int totalPrice;
  const CustomFitResult(
      {Key? key,
      required this.imageGenerated,
      required this.data,
      required this.totalPrice})
      : super(key: key);

  @override
  State<CustomFitResult> createState() => _CustomFitResultState();
}

class _CustomFitResultState extends State<CustomFitResult> {
  @override
  Widget build(BuildContext context) {
    print(widget.data);

    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Container(
              height: screenHeight * 1,
              decoration: BoxDecoration(
                  color: const Color(0xFF1F1F1F).withOpacity(0.10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const NavCustomFitResult(),
                    Image.network(
                      widget.imageGenerated,
                      height: screenHeight * 0.8,
                      fit: BoxFit.fitHeight,
                    )
                  ],
                ),
              ),
            ),
            DraggableSheetCustomResult(
              data: widget.data,
              totalPrice: widget.totalPrice,
            ),
          ],
        ),
      ),
    );
  }
}
