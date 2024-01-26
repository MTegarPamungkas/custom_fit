import 'package:flutter/material.dart';

class CardProductCustomFit extends StatelessWidget {
  final String? imagesPath;
  final bool isChecked;
  final VoidCallback onTap;

  const CardProductCustomFit({
    Key? key,
    required this.imagesPath,
    required this.isChecked,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(6, 0, 6, 12),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0xFFF5F5FA),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                    width: 2,
                    color: isChecked
                        ? const Color(0xFF5D55B3)
                        : const Color(0xFFF5F5FA))),
          ),
          child: Column(
            children: [
              Image.network(
                imagesPath!,
                fit: BoxFit.cover,
                // width: 200,
                height: 150,
                // width: double.infinity,
                // color: isChecked ? Colors.white : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
