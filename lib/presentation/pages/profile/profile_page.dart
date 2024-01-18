import 'package:custom_fit/domain/value_objects/email.dart';
import 'package:custom_fit/presentation/pages/onboarding/onboarding_one.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String storedEmail;

  final box = GetStorage();
  Future<void> _retrieveStoredData() async {
    final emailString = box.read('userEmail');

    if (emailString != null) {
      storedEmail = Email(emailString).value;
    } else {
      storedEmail = "Kosong";
    }
  }

  Future<void> _logout() async {
    box.remove('userEmail');
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const OnboardingOne(),
      ),
      (route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    _retrieveStoredData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Container(
                  height: 125.0,
                  color: const Color(0xFF5D55B3),
                ),
                Positioned(
                  top: 80.0,
                  left: 15.0,
                  child: Column(
                    children: [
                      Container(
                        height: 80.0,
                        width: 80.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("images/google.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Text(
                              'Jane Doe',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Geometr415 Blk BT',
                                fontWeight: FontWeight.w600,
                                height: 0,
                                letterSpacing: 0.72,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(
                                color: Color(0xFF757575),
                                fontSize: 13,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Information',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    SizedBox(height: 8),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Confimartion Payment',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 15,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Make payment first before confirming',
                            style: TextStyle(
                              color: Color(0xFF4D4D4D),
                              fontSize: 13,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Help',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    SizedBox(height: 8),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Terms and privacy policy',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 15,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Contact Us',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 15,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Question? need help?',
                            style: TextStyle(
                              color: Color(0xFF4D4D4D),
                              fontSize: 13,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            'About application',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 15,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Other',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    SizedBox(height: 8),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Add account',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 15,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Leave',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 15,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            'You enter as Jane Doe',
                            style: TextStyle(
                              color: Color(0xFF4D4D4D),
                              fontSize: 13,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () => _logout(),
                child: Container(
                  height: 42,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFDF1818),
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
                          height: double.infinity,
                          child: Text(
                            'Leave Account',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
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
        ),
      ),
    );
  }
}
