import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_fit/domain/entities/clothes.dart';
import 'package:custom_fit/infrastructure/services/clothes_service.dart';
import 'package:custom_fit/presentation/widgets/card_product_home.dart';
import 'package:custom_fit/presentation/widgets/draggable_sheet.dart';
import 'package:flutter/material.dart';
import 'package:custom_fit/presentation/widgets/banner_home.dart';
import 'package:custom_fit/presentation/widgets/nav_home.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
            FutureBuilder(
              future: ClothesService().getAllClothes(),
              builder: (context,
                  AsyncSnapshot<
                          Map<String,
                              List<QuerySnapshot<Map<String, dynamic>>>>>
                      snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  EasyLoading.dismiss();
                  if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  }

                  if (snapshot.data!.isEmpty) {
                    return const Text("No data");
                  }

                  var allClothesMap = snapshot.data!;
                  List<Clothes> tshirtList = [];
                  List<Clothes> pantsList = [];
                  List<Clothes> skirtList = [];

                  if (allClothesMap.containsKey('tshirt') &&
                      allClothesMap['tshirt']!.isNotEmpty) {
                    tshirtList = allClothesMap['tshirt']![0]
                        .docs
                        .map((doc) => Clothes.fromFirestore(doc))
                        .toList();
                  }

                  if (allClothesMap.containsKey('pants') &&
                      allClothesMap['pants']!.isNotEmpty) {
                    pantsList = allClothesMap['pants']![0]
                        .docs
                        .map((doc) => Clothes.fromFirestore(doc))
                        .toList();
                  }

                  if (allClothesMap.containsKey('skirt') &&
                      allClothesMap['skirt']!.isNotEmpty) {
                    skirtList = allClothesMap['skirt']![0]
                        .docs
                        .map((doc) => Clothes.fromFirestore(doc))
                        .toList();
                  }

                  return DraggableSheetCustom(
                    clothestList: [...tshirtList, ...pantsList, ...skirtList],
                  );
                } else if (snapshot.connectionState == ConnectionState.none) {
                  return const Text("No data");
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
