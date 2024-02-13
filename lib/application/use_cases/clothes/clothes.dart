import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_fit/infrastructure/services/clothes_service.dart';

class GetClothesUseCase {
  final ClothesService clothesService;

  GetClothesUseCase(this.clothesService);

  Future<Future<Map<String, List<QuerySnapshot<Map<String, dynamic>>>>>>
      execute() async {
    return clothesService.getAllClothes();
  }
}
