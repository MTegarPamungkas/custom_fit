import 'package:flutter/material.dart';

class CardProductCustomFit extends StatelessWidget {
  final String? imagesPath;
  const CardProductCustomFit({Key? key, required this.imagesPath})
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
                Image.asset(
                  imagesPath!,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
