import 'package:flutter/material.dart';

class TotalPrice extends StatelessWidget {
  final int totalPrice;
  const TotalPrice({Key? key, required this.totalPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: double.infinity,
              child: Text(
                'Total Price ',
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
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            'Price of clothes',
                            style: TextStyle(
                              color:
                                  Colors.black.withOpacity(0.800000011920929),
                              fontSize: 13,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Text(
                              'Rp.$totalPrice',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black
                                    .withOpacity(0.8999999761581421),
                                fontSize: 13,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 95,
                          child: Text(
                            'Priority Sewing',
                            style: TextStyle(
                              color:
                                  Colors.black.withOpacity(0.800000011920929),
                              fontSize: 13,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Text(
                              'Rp.25000',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black
                                    .withOpacity(0.8999999761581421),
                                fontSize: 13,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            'Handling fees',
                            style: TextStyle(
                              color:
                                  Colors.black.withOpacity(0.800000011920929),
                              fontSize: 13,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Text(
                              'Rp.7500',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black
                                    .withOpacity(0.8999999761581421),
                                fontSize: 13,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 21),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text(
                        'All Prices',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.800000011920929),
                          fontSize: 13,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: Text(
                          'Rp.${totalPrice + 25000 + 7500}',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8999999761581421),
                            fontSize: 13,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
