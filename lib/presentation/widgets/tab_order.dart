import 'dart:convert';

import 'package:custom_fit/domain/entities/clothes.dart';
import 'package:custom_fit/domain/entities/order_item.dart';
import 'package:custom_fit/presentation/pages/order/detail_order_page.dart';
import 'package:custom_fit/presentation/widgets/card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TabOrder extends StatefulWidget {
  final List<OrderItem> listNotYetPaid;
  final List<OrderItem> listProcess;
  final List<OrderItem> listSent;
  final List<OrderItem> listDone;
  const TabOrder(
      {Key? key,
      required this.listNotYetPaid,
      required this.listProcess,
      required this.listSent,
      required this.listDone})
      : super(key: key);

  @override
  State<TabOrder> createState() => _TabOrderState();
}

class _TabOrderState extends State<TabOrder> {
  late int _selectedTabIndex;

  @override
  void initState() {
    super.initState();
    _selectedTabIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Expanded(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            TabBar(
              padding: EdgeInsets.zero,
              isScrollable: true,
              onTap: (index) {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
              labelPadding: const EdgeInsets.only(right: 4, left: 15),
              tabAlignment: TabAlignment.center,
              tabs: [
                _buildTab('images/user.png', "Not yet paid", 0),
                _buildTab('images/tshirt.png', "Sewing process", 1),
                _buildTab('images/skirt.png', "Sent", 2),
                _buildTab('images/pants.png', "Done", 3),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBarView(
                  children: [
                    buildTabContentNotYetPaid(widget.listNotYetPaid),
                    buildTabContentSewing(widget.listProcess),
                    buildTabContentSent(widget.listSent),
                    buildTabContentDone(widget.listDone),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  LayoutBuilder _buildTab(String imagePath, String text, int index) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final tp = TextPainter(
          text: TextSpan(text: text, style: const TextStyle(fontSize: 14)),
          textDirection: TextDirection.ltr,
        );
        tp.layout();
        final double textWidth = tp.width;
        final double containerWidth =
            _selectedTabIndex == index ? textWidth + 50 : textWidth + 30;

        return Tab(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: containerWidth,
            margin: EdgeInsets.zero,
            height: 35,
            padding: EdgeInsets.zero,
            decoration: ShapeDecoration(
              color: _selectedTabIndex == index
                  ? const Color(0xFF5D55B3)
                  : const Color(0xFFF5F5FA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: _selectedTabIndex == index
                        ? Colors.white
                        : Colors.black,
                    fontSize: 14,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildTabContentNotYetPaid(List<OrderItem> listNotYetPaid) {
    if (listNotYetPaid.isEmpty) {
      return const Center(
        child: Text("No data"),
      );
    }
    return AlignedGridView.count(
      crossAxisCount: 1,
      mainAxisSpacing: 12,
      itemCount: listNotYetPaid.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailOrderPage(),
              ),
            );
          },
          child: CardItem(
            clothes: Clothes(id: "0", idModel: "0", img: "0", desc: "0"),
          ),
        );
      },
    );
  }

  Widget buildTabContentSewing(List<OrderItem> listProcess) {
    if (listProcess.isEmpty) {
      return const Center(
        child: Text("No data"),
      );
    }
    return AlignedGridView.count(
      crossAxisCount: 1,
      mainAxisSpacing: 12,
      itemCount: listProcess.length,
      itemBuilder: (context, index) {
        OrderItem orderItem = listProcess[index];
        List<dynamic> itemList = jsonDecode(orderItem.item);

        // Create a list of CardItem widgets
        List<Widget> cardItems = itemList.map((item) {
          return CardItem(
            clothes: Clothes(
              id: item['id'],
              idModel: item['id_model'],
              img: item['img'],
              desc: item['desc'],
              price: item['price'],
              // Include other fields as needed
            ),
          );
        }).toList();

        // Return a column containing the CardItem widgets
        return Column(
          children: cardItems,
        );
      },
    );
  }

  Widget buildTabContentSent(List<OrderItem> listSent) {
    if (listSent.isEmpty) {
      return const Center(
        child: Text("No data"),
      );
    }
    return AlignedGridView.count(
      crossAxisCount: 1,
      mainAxisSpacing: 12,
      itemCount: listSent.length,
      itemBuilder: (context, index) {
        return CardItem(
            clothes: Clothes(id: "0", idModel: "0", img: "0", desc: "0"));
      },
    );
  }

  Widget buildTabContentDone(List<OrderItem> listDone) {
    if (listDone.isEmpty) {
      return const Center(
        child: Text("No data"),
      );
    }
    return AlignedGridView.count(
      crossAxisCount: 1,
      mainAxisSpacing: 12,
      itemCount: listDone.length,
      itemBuilder: (context, index) {
        return CardItem(
            clothes: Clothes(id: "0", idModel: "0", img: "0", desc: "0"));
      },
    );
  }
}
