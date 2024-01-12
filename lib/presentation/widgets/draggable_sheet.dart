import 'package:custom_fit/presentation/widgets/material_item.dart';
import 'package:custom_fit/presentation/widgets/order_item.dart';
import 'package:custom_fit/presentation/widgets/price_item.dart';
import 'package:custom_fit/presentation/widgets/size_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:custom_fit/presentation/widgets/card_product_custom_fit.dart';
import 'package:custom_fit/presentation/widgets/subtitle_text_auth.dart';
import 'package:custom_fit/presentation/widgets/title_text_auth.dart';

class DraggableSheetCustom extends StatelessWidget {
  final Widget item;

  const DraggableSheetCustom({Key? key, required this.item}) : super(key: key);

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
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return item;
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
  const DraggableSheetCustom2({Key? key}) : super(key: key);

  @override
  State<DraggableSheetCustom2> createState() => _DraggableSheetCustom2State();
}

class _DraggableSheetCustom2State extends State<DraggableSheetCustom2> {
  late int _selectedTabIndex;

  @override
  void initState() {
    super.initState();
    _selectedTabIndex = 0;
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
                        _buildTab('images/user.png', "Model", 0),
                        _buildTab('images/tshirt.png', "Tshirt", 1),
                        _buildTab('images/skirt.png', "Skirt", 2),
                        _buildTab('images/pants.png', "Pants", 3),
                        _buildTab('images/pentool.png', "Ya", 4),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        buildTabContentModel(),
                        buildTabContentTshirt(),
                        buildTabContentSkirt(),
                        buildTabContentPants(),
                        buildTabContentYa()
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

  Tab _buildTab(String imagePath, String text, int index) {
    return Tab(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: _selectedTabIndex == index ? 100 : 80,
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
  }

  Widget buildTabContentModel() {
    return AlignedGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      itemBuilder: (context, index) {
        return const CardProductCustomFit(imagesPath: "images/samplemodel.png");
      },
    );
  }

  Widget buildTabContentTshirt() {
    return AlignedGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      itemBuilder: (context, index) {
        return const CardProductCustomFit(
            imagesPath: "images/sampletshirt.png");
      },
    );
  }

  Widget buildTabContentSkirt() {
    return AlignedGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      itemBuilder: (context, index) {
        return const CardProductCustomFit(imagesPath: "images/sampleskirt.png");
      },
    );
  }

  Widget buildTabContentPants() {
    return AlignedGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      itemBuilder: (context, index) {
        return const CardProductCustomFit(imagesPath: "images/samplemodel.png");
      },
    );
  }

  Widget buildTabContentYa() {
    return AlignedGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      itemBuilder: (context, index) {
        return const CardProductCustomFit(imagesPath: "images/samplemodel.png");
      },
    );
  }
}

class DraggableSheetCustomResult extends StatelessWidget {
  final Widget item;

  const DraggableSheetCustomResult({Key? key, required this.item})
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
                    children: const [
                      TitleTextAuth(title: "Countryside-Inspired Fashion"),
                      SizedBox(height: 8.0),
                      SubTitleTextAuth(
                        title:
                            "Clothes will be determined by the material and size chosen. The choice of material and size affects the payment price. See All",
                      ),
                      SizedBox(height: 32.0),
                      MaterialItem(),
                      SizedBox(height: 16.0),
                      SizeItem(),
                      SizedBox(height: 32.0),
                      PriceItem(),
                      SizedBox(height: 32.0),
                      OrderItem(),
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
