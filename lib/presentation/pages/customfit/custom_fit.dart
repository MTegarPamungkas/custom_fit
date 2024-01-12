import 'package:custom_fit/presentation/widgets/draggable_sheet.dart';
import 'package:custom_fit/presentation/widgets/nav_custom_fit.dart';
import 'package:flutter/material.dart';

class CustomFit extends StatelessWidget {
  const CustomFit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    const NavCustomFit(),
                    Image.asset(
                      "images/samplemodel.png",
                      height: screenHeight * 0.8,
                    )
                  ],
                ),
              ),
            ),
            const DraggableSheetCustom2(
                // item: CardProductCustomFit(),
                ),
          ],
        ),
      ),
    );
  }
}
