import 'dart:convert';
import 'dart:ffi';

import 'package:custom_fit/domain/entities/clothes.dart';
import 'package:custom_fit/infrastructure/data/remote/try_on_client.dart';
import 'package:custom_fit/infrastructure/services/try_on_service.dart';
import 'package:custom_fit/presentation/pages/customfit/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';

class NavCustomFit extends StatefulWidget {
  const NavCustomFit({Key? key}) : super(key: key);

  @override
  State<NavCustomFit> createState() => _NavCustomFitState();
}

class _NavCustomFitState extends State<NavCustomFit> {
  final box = GetStorage();
  late List<Clothes?> savedItems;
  // late List<String?> typeArray;
  late String? typeArray;
  late String? selectedBottom;
  late String? selectedTop;
  late String? selectedModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    box.remove("selectedItems");
  }

  int calculateTotalPrice(List<Clothes?> savedItems) {
    Set<String?> uniqueBottomTypes = {};
    int totalPrice = 0;

    for (var clothes in savedItems) {
      if (clothes != null &&
          (clothes.type == "bottom" || clothes.type == "top")) {
        if (clothes.type == "bottom" &&
            !uniqueBottomTypes.contains(clothes.type)) {
          uniqueBottomTypes.add(clothes.id);
          totalPrice += int.tryParse(clothes.price ?? '0') ?? 0;
        } else if (clothes.type == "top") {
          totalPrice += int.tryParse(clothes.price ?? '0') ?? 0;
        }
      }
    }

    return totalPrice;
  }

  void loadSavedItem() {
    savedItems = (box.read<List<Map<String, dynamic>?>>("selectedItems") ?? [])
        .where((map) => map != null)
        .map((map) => Clothes.fromMap(map!))
        .toList();

    // typeArray = savedItems
    //     .where((clothes) =>
    //         clothes != null &&
    //         (clothes.type == "bottom" || clothes.type == "top"))
    //     .map((clothes) => clothes)
    //     .cast<String?>()
    //     .toList();

    // Filter savedItems to include only "bottom" and "top"
    List<Clothes?> filteredItems = savedItems
        .where((clothes) =>
            clothes != null &&
            (clothes.type == "bottom" || clothes.type == "top"))
        .toList();

    Clothes defaultClothes = Clothes(
      id: '',
      idModel: '',
      img: '',
      desc: '',
    );

    Clothes? firstTop = filteredItems.firstWhere(
      (clothes) => clothes != null && clothes.type == "top",
      orElse: () => defaultClothes,
    );

    Clothes? firstBottom = filteredItems.firstWhere(
      (clothes) => clothes != null && clothes.type == "bottom",
      orElse: () => defaultClothes,
    );

    // Convert firstTop and firstBottom to a List<Map<String, dynamic>>
    List<Map<String, dynamic>> jsonList = [];

    if (firstTop != null && firstTop.id.isNotEmpty) {
      jsonList.add(firstTop.toMap());
    }

    if (firstBottom != null && firstBottom.id.isNotEmpty) {
      jsonList.add(firstBottom.toMap());
    }

    typeArray = jsonEncode(jsonList);

    selectedBottom = savedItems
        .where((clothes) => clothes != null && clothes.type == "bottom")
        .map((clothes) => clothes!.idModel)
        .firstOrNull;

    selectedTop = savedItems
        .where((clothes) => clothes != null && clothes.type == "top")
        .map((clothes) => clothes!.idModel)
        .firstOrNull;

    selectedModel = savedItems
        .where((clothes) => clothes != null && clothes.type == "model")
        .map((clothes) => clothes!.idModel)
        .firstOrNull;
  }

  Future testApi(String? top, String? bottom, String? modelId) async {
    EasyLoading.show(status: 'process...');
    try {
      final tryOnApiClient = TryOnApiClient();

      final tryOnService = TryOnService(tryOnApiClient);

      final tryOnResult = await tryOnService.requestTryOn(top, bottom, modelId);

      // Print the result
      print('Try-On Result:');
      print('Gender: ${tryOnResult.gender}');
      print('Model File: ${tryOnResult.modelFile}');
      print('Model ID: ${tryOnResult.modelId}');
      print('Shoes ID: ${tryOnResult.shoesId ?? 'N/A'}');
      print('Version: ${tryOnResult.version}');
      print('Success: ${tryOnResult.success}');
      print('Image URL: ${tryOnResult.imageUrl}');
      EasyLoading.dismiss();

      int totalItemCount = calculateTotalPrice(savedItems);

      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CustomFitResult(
            totalPrice: totalItemCount,
            data: typeArray,
            imageGenerated: tryOnResult.imageUrl,
          ),
        ),
      );
    } catch (error) {
      // Handle any errors that might occur
      print('Error: $error');
      EasyLoading.dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          width: 120,
          height: 23,
          child: Text(
            'Customfit',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Geometr415 Blk BT',
              fontWeight: FontWeight.w600,
              height: 0,
              letterSpacing: 1.28,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            loadSavedItem();
            // print(savedItems);
            testApi(selectedTop, selectedBottom, selectedModel);
          },
          child: Container(
            width: 100,
            height: 35,
            padding: const EdgeInsets.symmetric(vertical: 0),
            decoration: ShapeDecoration(
              color: const Color(0xFF5D55B3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Text(
                      'See result',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class NavCustomFitResult extends StatelessWidget {
  const NavCustomFitResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            size: 25,
          ),
        ),
        const SizedBox(
          width: 120,
          height: 23,
          child: Text(
            'Customfit',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Geometr415 Blk BT',
              fontWeight: FontWeight.w600,
              height: 0,
              letterSpacing: 1.28,
            ),
          ),
        ),
        Image.asset(
          "images/cart.png",
          width: 25,
        ),
      ],
    );
  }
}
