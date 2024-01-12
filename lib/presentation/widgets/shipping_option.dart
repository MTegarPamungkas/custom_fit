import 'package:flutter/material.dart';

class ShippingOption extends StatelessWidget {
  const ShippingOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            child: Text(
              'Shipping Options',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: ShapeDecoration(
              color: Color(0xFFE2E0F1),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: Color(0xFF5D55B3),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Priority Sewing',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '07 January 2024 - 14 January 2024',
                              style: TextStyle(
                                color:
                                    Colors.black.withOpacity(0.800000011920929),
                                fontSize: 12,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 190,
                        child: Text(
                          'With priority sewing, clothes will be made quickly and sent straight away',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 65),
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$50',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF727272),
                          fontSize: 12,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.lineThrough,
                          height: 0,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '\$40',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
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
        ],
      ),
    );
  }
}
