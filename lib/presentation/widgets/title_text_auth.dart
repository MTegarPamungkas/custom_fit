import 'package:flutter/material.dart';

class TitleTextAuth extends StatelessWidget {
  final String title;
  final Alignment alignment;
  const TitleTextAuth(
      {Key? key, required this.title, this.alignment = Alignment.centerLeft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: alignment,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        ),
      ],
    );
  }
}
