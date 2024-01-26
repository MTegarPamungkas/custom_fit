import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_fit/domain/entities/clothes.dart';
import 'package:custom_fit/domain/entities/order_item.dart';
import 'package:custom_fit/infrastructure/services/clothes_service.dart';
import 'package:custom_fit/presentation/widgets/nav_order.dart';
import 'package:custom_fit/presentation/widgets/tab_order.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: NavOrder(),
            ),
            FutureBuilder(
              future: ClothesService().getAllOrder(auth.currentUser!.uid),
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
                    return const TabOrder(
                      listNotYetPaid: [],
                      listProcess: [],
                      listSent: [],
                      listDone: [],
                    );
                  }

                  var allClothesMap = snapshot.data!;
                  List<OrderItem> listNotYetPaid = [];
                  List<OrderItem> listProcess = [];
                  List<OrderItem> listSent = [];
                  List<OrderItem> listDone = [];

                  void processStatus(
                      String type, int status, List<OrderItem> list) {
                    if (allClothesMap.containsKey(type) &&
                        allClothesMap[type]!.isNotEmpty) {
                      list.addAll(
                        allClothesMap[type]![0]
                            .docs
                            .where((doc) => doc['status'] == status)
                            .map((doc) => OrderItem.fromFirestore(doc))
                            .toList(),
                      );
                    }
                  }

                  processStatus('priority', 1, listNotYetPaid);
                  processStatus('priority', 2, listProcess);
                  processStatus('priority', 3, listSent);
                  processStatus('priority', 4, listDone);

                  processStatus('normal', 1, listNotYetPaid);
                  processStatus('normal', 2, listProcess);
                  processStatus('normal', 3, listSent);
                  processStatus('normal', 4, listDone);

                  return TabOrder(
                    listNotYetPaid: listNotYetPaid,
                    listProcess: listProcess,
                    listSent: listSent,
                    listDone: listDone,
                  );
                } else if (snapshot.connectionState == ConnectionState.none) {
                  return const TabOrder(
                    listNotYetPaid: [],
                    listProcess: [],
                    listSent: [],
                    listDone: [],
                  );
                }
                return Container();
              },
            )

            // TabOrder()
          ],
        ),
      ),
    );
  }
}
