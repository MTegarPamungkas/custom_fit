import 'package:custom_fit/presentation/pages/customfit/result.dart';
import 'package:flutter/material.dart';

class NavCustomFit extends StatelessWidget {
  const NavCustomFit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          width: 120,
          height: 23,
          child: Text(
            'Customfit',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Geometr415 Blk BT',
              fontWeight: FontWeight.w600,
              height: 0,
              letterSpacing: 1.28,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CustomFitResult(),
              ),
            );
          },
          child: Container(
            width: 100,
            height: 35,
            padding: const EdgeInsets.symmetric(vertical: 0),
            decoration: ShapeDecoration(
              color: const Color(0xFF5D55B3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Text(
                      'See result',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class NavCustomFitResult extends StatelessWidget {
  const NavCustomFitResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            size: 25,
          ),
        ),
        const SizedBox(
          width: 120,
          height: 23,
          child: Text(
            'Customfit',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Geometr415 Blk BT',
              fontWeight: FontWeight.w600,
              height: 0,
              letterSpacing: 1.28,
            ),
          ),
        ),
        Image.asset(
          "images/cart.png",
          width: 25,
        ),
      ],
    );
  }
}
