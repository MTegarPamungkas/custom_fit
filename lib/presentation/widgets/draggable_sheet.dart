import 'dart:ffi';

import 'package:custom_fit/domain/entities/clothes.dart';
import 'package:custom_fit/presentation/widgets/card_product_home.dart';
import 'package:custom_fit/presentation/widgets/material_item.dart';
import 'package:custom_fit/presentation/widgets/order_item.dart';
import 'package:custom_fit/presentation/widgets/price_item.dart';
import 'package:custom_fit/presentation/widgets/size_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:custom_fit/presentation/widgets/card_product_custom_fit.dart';
import 'package:custom_fit/presentation/widgets/subtitle_text_auth.dart';
import 'package:custom_fit/presentation/widgets/title_text_auth.dart';
import 'package:get_storage/get_storage.dart';

class DraggableSheetCustom extends StatelessWidget {
  final List<Clothes> clothestList;

  const DraggableSheetCustom({Key? key, required this.clothestList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      maxChildSize: 0.7,
      minChildSize: 0.65,
      snap: true,
      shouldCloseOnMinExtent: false,
      expand: true,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.0),
              topRight: Radius.circular(18.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                ListView(
                  padding: EdgeInsets.zero,
                  controller: scrollController,
                  shrinkWrap: true,
                  children: const [
                    TitleTextAuth(title: "Our Collection"),
                    SizedBox(height: 8.0),
                    SubTitleTextAuth(
                      title:
                          "List of our clothing collections that can be tried on directly and sewn sent to your home ",
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
                Expanded(
                  child: AlignedGridView.count(
                    itemCount: clothestList.length,
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return CardProductHome(
                        image: clothestList[index].img,
                        price: clothestList[index].price,
                        desc: clothestList[index].desc,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DraggableSheetCustom2 extends StatefulWidget {
  final List<Clothes> tshirtList;
  final List<Clothes> pantsList;
  final List<Clothes> skirtList;
  final List<Clothes> modelList;

  const DraggableSheetCustom2({
    Key? key,
    required this.tshirtList,
    required this.pantsList,
    required this.skirtList,
    required this.modelList,
  }) : super(key: key);

  @override
  State<DraggableSheetCustom2> createState() => _DraggableSheetCustom2State();
}

class _DraggableSheetCustom2State extends State<DraggableSheetCustom2> {
  late int _selectedTabIndex;
  List<Clothes?> selectedItems = List.generate(5, (index) => null);
  late final GetStorage _storage;

  @override
  void initState() {
    super.initState();
    _storage = GetStorage();

    _selectedTabIndex = 0;
    selectedItems[0] = widget.modelList.isNotEmpty ? widget.modelList[0] : null;
    saveItems();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future saveItems() async {
    await _storage.write(
        "selectedItems", selectedItems.map((item) => item?.toMap()).toList());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: DraggableScrollableSheet(
        initialChildSize: 0.15,
        maxChildSize: 0.7,
        minChildSize: 0.15,
        expand: true,
        builder: (context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  SingleChildScrollView(
                    controller: scrollController,
                    child: TabBar(
                      padding: EdgeInsets.zero,
                      isScrollable: true,
                      onTap: (index) {
                        setState(() {
                          _selectedTabIndex = index;
                        });
                      },
                      tabAlignment: TabAlignment.start,
                      tabs: [
                        _buildTab('images/user.png', "Role model", 0),
                        _buildTab('images/tshirt.png', "Tshirt", 1),
                        _buildTab('images/skirt.png', "Skirt", 2),
                        _buildTab('images/pants.png', "Pants", 3),
                        _buildTab('images/pentool.png', "Ya", 4),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        buildTabContent(widget.modelList, 0),
                        buildTabContent(widget.tshirtList, 1),
                        buildTabContent(widget.skirtList, 2),
                        buildTabContent(widget.pantsList, 3),
                        buildTabContent(widget.pantsList, 4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
          height: 35,
          padding: const EdgeInsets.symmetric(vertical: 0),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 20,
                color: _selectedTabIndex == index
                    ? Colors.white
                    : const Color(0xFF5D55B3),
              ),
              const SizedBox(
                width: 4,
              ),
              Visibility(
                visible: _selectedTabIndex == index,
                child: Text(
                  text,
                  style: TextStyle(
                    color: _selectedTabIndex == index
                        ? Colors.white
                        : Colors.transparent,
                    fontSize: 14,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget buildTabContent(List<Clothes> clothesList, int categoryIndex) {
    return AlignedGridView.count(
      crossAxisCount: 2,
      itemCount: clothesList.length,
      crossAxisSpacing: 16,
      itemBuilder: (context, index) {
        final clothes = clothesList[index];
        return CardProductCustomFit(
          imagesPath: clothes.img,
          isChecked: _selectedTabIndex == categoryIndex &&
              selectedItems[categoryIndex] == clothes,
          onTap: () {
            setState(() {
              if (_selectedTabIndex == categoryIndex &&
                  selectedItems[categoryIndex] == clothes) {
                selectedItems[categoryIndex] = null;
              } else {
                _selectedTabIndex = categoryIndex;
                selectedItems[categoryIndex] = clothes;
              }
              saveItems();
            });
          },
        );
      },
    );
  }
}

class DraggableSheetCustomResult extends StatelessWidget {
  final int totalPrice;
  final String? data;

  const DraggableSheetCustomResult(
      {Key? key, required this.totalPrice, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.15,
      maxChildSize: 0.5,
      minChildSize: 0.15,
      snap: true,
      shouldCloseOnMinExtent: false,
      expand: true,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.0),
              topRight: Radius.circular(18.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    controller: scrollController,
                    // shrinkWrap: true,
                    children: [
                      const TitleTextAuth(
                          title: "Countryside-Inspired Fashion"),
                      const SizedBox(height: 8.0),
                      const SubTitleTextAuth(
                        title:
                            "Clothes will be determined by the material and size chosen. The choice of material and size affects the payment price. See All",
                      ),
                      const SizedBox(height: 32.0),
                      const MaterialItem(),
                      const SizedBox(height: 16.0),
                      const SizeItem(),
                      const SizedBox(height: 32.0),
                      PriceItem(
                        totalPrice: totalPrice,
                      ),
                      const SizedBox(height: 32.0),
                      OrderItem(
                        data: data,
                        totalPrice: totalPrice,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
