import 'package:flutter/material.dart';

class UsernameTextField extends StatelessWidget {
  final TextEditingController controller;

  const UsernameTextField({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Username',
          style: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontSize: 16,
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.w400,
            height: 1.5,
            letterSpacing: 0.28,
          ),
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: Color(0xFFF5F5FA)),
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 9),
          child: TextField(
            controller: controller,
            style: TextStyle(
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(0.55)),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Your username',
                hintStyle: TextStyle(
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.55))),
          ),
        ),
      ],
    );
  }
}
