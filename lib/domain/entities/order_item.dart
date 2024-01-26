import 'package:cloud_firestore/cloud_firestore.dart';

class OrderItem {
  final String orderNumber;
  final String item;
  final String material;
  final String sewing;
  final String size;
  final int status;
  final Timestamp timestamp;
  final String userId;

  OrderItem({
    required this.orderNumber,
    required this.item,
    required this.material,
    required this.sewing,
    required this.size,
    required this.status,
    required this.timestamp,
    required this.userId,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      orderNumber: json['orderNumber'],
      item: json['item'],
      material: json['material'],
      sewing: json['sewing'],
      size: json['size'],
      status: json['status'],
      timestamp: json['tipestamp'],
      userId: json['userId'],
    );
  }

  factory OrderItem.fromFirestore(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    return OrderItem(
      orderNumber: snapshot['orderNumber'] ?? '',
      item: snapshot['item'] ?? '',
      material: snapshot['material'] ?? '',
      sewing: snapshot['sewing'] ?? '',
      size: snapshot['size'] ?? '',
      status: snapshot['status'] ?? -1,
      timestamp: snapshot['timestamp'] ?? '',
      userId: snapshot['userId'] ?? '',
    );
  }
}
