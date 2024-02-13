import 'package:cloud_firestore/cloud_firestore.dart';

class Clothes {
  final String id;
  final String idModel;
  final String img;
  final String desc;
  final String? price;
  final String? type;

  Clothes({
    required this.id,
    required this.idModel,
    required this.img,
    required this.desc,
    this.price,
    this.type,
  });

  factory Clothes.fromMap(Map<String, dynamic> map) {
    return Clothes(
      id: map['id'],
      idModel: map['id_model'],
      img: map['img'],
      desc: map['desc'],
      price: map['price'],
      type: map['type'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_model': idModel,
      'img': img,
      'desc': desc,
      'price': price,
      'type': type,
    };
  }

  factory Clothes.fromFirestore(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    return Clothes(
      id: snapshot['id'] ?? '',
      idModel: snapshot['id_model'] ?? '',
      img: snapshot['img'] ?? '',
      desc: snapshot['desc'] ?? '',
      price: snapshot.data().containsKey('price') ? snapshot['price'] : null,
      type: snapshot.data().containsKey('type') ? snapshot['type'] : null,
    );
  }
}
