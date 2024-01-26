// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

class ClothesService {
  final box = GetStorage();
  Future<Map<String, List<QuerySnapshot<Map<String, dynamic>>>>>
      getAllClothes() async {
    var clothesRef =
        FirebaseFirestore.instance.collection("core").doc("clothes");

    var clothesTypes = ['tshirt', 'pants', 'skirt', 'model'];

    Map<String, List<QuerySnapshot<Map<String, dynamic>>>> allClothes = {};
    for (var type in clothesTypes) {
      var snapshot = await clothesRef.collection(type).get();

      if (snapshot.docs.isNotEmpty) {
        allClothes[type] = [snapshot];
      }
    }

    return allClothes;
  }

  Future<Map<String, List<QuerySnapshot<Map<String, dynamic>>>>> getAllOrder(
      String userUid) async {
    var clothesRef = FirebaseFirestore.instance.collection("core").doc("order");

    var orderTypes = ['priority', 'normal'];

    Map<String, List<QuerySnapshot<Map<String, dynamic>>>> allOrder = {};
    for (var type in orderTypes) {
      var snapshot = await clothesRef
          .collection(type)
          .where('userId', isEqualTo: userUid)
          .get();

      if (snapshot.docs.isNotEmpty) {
        allOrder[type] = [snapshot];
      }
    }

    return allOrder;
  }
}
