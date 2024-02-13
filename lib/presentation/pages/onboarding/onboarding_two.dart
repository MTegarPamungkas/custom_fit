import 'package:custom_fit/presentation/pages/authentication/register_page.dart';
import 'package:flutter/material.dart';

class OnboardingTwo extends StatelessWidget {
  const OnboardingTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5D55B3),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Experience when buying clothes, try them on first, then buy them.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 28),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 176,
                      height: 8,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFD91B3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 42.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        )
                      },
                      child: Image.asset(
                        "images/next.png",
                        width: 60.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "images/onboarding2.png",
                width: 300,
              ),
            )
          ],
        ),
      ),
    );
  }
}
