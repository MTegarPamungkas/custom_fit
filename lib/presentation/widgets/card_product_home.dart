import 'package:flutter/material.dart';

class CardProductHome extends StatelessWidget {
  final String? image;
  final String? price;
  final String? desc;
  const CardProductHome({Key? key, this.image, this.price, this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(6, 0, 6, 12),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: const Color(0xFFF5F5FA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Column(
              children: [
                Image.network(
                  image!,
                  fit: BoxFit.cover,
                  // width: 200,
                  height: 150,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  child: Text(
                    desc!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 6,
                // ),
                // SizedBox(
                //   child: Text(
                //     'Size L',
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       color: Colors.black.withOpacity(0.55),
                //       fontSize: 12,
                //       fontFamily: 'Open Sans',
                //       fontWeight: FontWeight.w400,
                //       height: 0,
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  child: Text(
                    'Rp.$price',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
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
