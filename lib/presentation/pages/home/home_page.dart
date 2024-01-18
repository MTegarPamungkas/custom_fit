import 'package:custom_fit/presentation/widgets/card_product_home.dart';
import 'package:custom_fit/presentation/widgets/draggable_sheet.dart';
import 'package:flutter/material.dart';
import 'package:custom_fit/presentation/widgets/banner_home.dart';
import 'package:custom_fit/presentation/widgets/nav_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Container(
              height: screenHeight * 0.4,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.3, -1.5),
                  end: Alignment(0.7, 1.2),
                  colors: [Colors.white, Color(0xFFFD91B3), Color(0xFF856EB8)],
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    NavHome(),
                    SizedBox(
                      height: 10,
                    ),
                    BannerHome(),
                  ],
                ),
              ),
            ),
            const DraggableSheetCustom(
              item: CardProductHome(),
            ),
          ],
        ),
      ),
    );
  }
}
