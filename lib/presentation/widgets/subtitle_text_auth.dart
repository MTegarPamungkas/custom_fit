import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SubTitleTextAuth extends StatelessWidget {
  final String title;
  final String? buttonText;
  final dynamic onPressed; // Update the type to allow both Widget and Function
  final Alignment alignment;

  const SubTitleTextAuth({
    Key? key,
    required this.title,
    this.buttonText,
    this.alignment = Alignment.centerLeft,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: Align(
                alignment: alignment,
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: title,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.55),
                          fontSize: 15,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      if (buttonText != null)
                        TextSpan(
                          text: ' ${buttonText!}',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              if (onPressed is Widget) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => onPressed,
                                  ),
                                );
                              } else if (onPressed is Function) {
                                onPressed();
                              }
                            },
                          style: const TextStyle(
                            color: Color(0xFF5D55B3),
                            fontSize: 16,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
