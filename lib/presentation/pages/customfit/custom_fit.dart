import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_fit/domain/entities/clothes.dart';
import 'package:custom_fit/infrastructure/services/clothes_service.dart';
import 'package:custom_fit/presentation/widgets/draggable_sheet.dart';
import 'package:custom_fit/presentation/widgets/nav_custom_fit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';

class CustomFit extends StatefulWidget {
  const CustomFit({Key? key}) : super(key: key);

  @override
  State<CustomFit> createState() => _CustomFitState();
}

class _CustomFitState extends State<CustomFit> {
  final GetStorage _storage = GetStorage();

  @override
  void initState() {
    super.initState();
    EasyLoading.show(status: 'Loading...');
  }

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
                    Image.network(
                      "https://i.ibb.co/H77sJhv/default-model.png",
                      height: screenHeight * 0.8,
                      fit: BoxFit.fitHeight,
                    )
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
                  List<Clothes> modelList = [];
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

                  if (allClothesMap.containsKey('model') &&
                      allClothesMap['model']!.isNotEmpty) {
                    modelList = allClothesMap['model']![0]
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

                  return DraggableSheetCustom2(
                    tshirtList: tshirtList,
                    pantsList: pantsList,
                    skirtList: skirtList,
                    modelList: modelList,
                  );
                } else if (snapshot.connectionState == ConnectionState.none) {
                  return const Text("No data");
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
