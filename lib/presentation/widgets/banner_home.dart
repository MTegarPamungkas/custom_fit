import 'package:custom_fit/presentation/pages/customfit/custom_fit.dart';
import 'package:flutter/material.dart';

class BannerHome extends StatelessWidget {
  const BannerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFFFDFDFD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        child: Text(
                          'Create your own\nclothing design with \ncustomfit',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CustomFit(),
                          ),
                        );
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
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
                                    'Try Now !',
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
                    )
                  ],
                )),
            Expanded(
              flex: 1,
              child: Image.asset(
                "images/image_banner.png",
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
