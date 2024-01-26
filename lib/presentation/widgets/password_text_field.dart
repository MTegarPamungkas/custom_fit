import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordTextField({Key? key, required this.controller})
      : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
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
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  obscureText: obscureText,
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.55),
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Your password',
                    hintStyle: TextStyle(
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.55),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.black.withOpacity(0.55),
                ),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
