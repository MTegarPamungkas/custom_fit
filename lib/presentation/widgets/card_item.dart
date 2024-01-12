import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: ShapeDecoration(
          color: Color(0xFFF5F5FA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/sampleitem.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 15),
            const Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Countryside-Inspired Fashion',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w600,
                        height: 1,
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Variaton: Cotton, XL',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '\$75',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
