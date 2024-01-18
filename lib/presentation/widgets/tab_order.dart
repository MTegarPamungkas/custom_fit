import 'package:custom_fit/presentation/pages/order/detail_order_page.dart';
import 'package:custom_fit/presentation/widgets/card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TabOrder extends StatefulWidget {
  const TabOrder({Key? key}) : super(key: key);

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
                    buildTabContentNotYetPaid(),
                    buildTabContentSewing(),
                    buildTabContentSent(),
                    buildTabContentDone(),
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

  Widget buildTabContentNotYetPaid() {
    return AlignedGridView.count(
      crossAxisCount: 1,
      mainAxisSpacing: 12,
      itemCount: 1,
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
          child: const CardItem(),
        );
      },
    );
  }

  Widget buildTabContentSewing() {
    return AlignedGridView.count(
      crossAxisCount: 1,
      mainAxisSpacing: 12,
      itemCount: 1,
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
          child: const CardItem(),
        );
      },
    );
  }

  Widget buildTabContentSent() {
    return AlignedGridView.count(
      crossAxisCount: 1,
      mainAxisSpacing: 12,
      itemCount: 1,
      itemBuilder: (context, index) {
        return const CardItem();
      },
    );
  }

  Widget buildTabContentDone() {
    return AlignedGridView.count(
      crossAxisCount: 1,
      mainAxisSpacing: 12,
      itemCount: 1,
      itemBuilder: (context, index) {
        return const CardItem();
      },
    );
  }
}
