import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      _navigationToNextScreenloginOrNot();
    });

    super.initState();
  }

  Future<void> _navigationToNextScreenloginOrNot() async {
    final prefs = await SharedPreferences.getInstance();
    final String? loginToken = prefs.getString('auth_token');
    if (loginToken != null) {
      final prefs = await SharedPreferences.getInstance();
      final String? storeId = prefs.getString('storeId_In_sharedpref');
      // User is logged in, navigate to the home screen
      Navigator.pushReplacementNamed(
        context,
        '/bottomnavbar',
        arguments: {
          'storeId': int.parse(storeId!),
        },
      );
    } else {
      // User is not logged in, navigate to the login screen
      final prefs = await SharedPreferences.getInstance();
      final String? savedOnBoardkey = prefs.getString('saved_onboard_key');
      print("1212222222222222222222111${savedOnBoardkey}");
      if (savedOnBoardkey != null) {
        Navigator.pushReplacementNamed(context, '/loginphonenumber');
      } else {
        print("sooo sad");
        Navigator.pushReplacementNamed(context, '/onboardingscreenone');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                image: AssetImage('assets/images/loginbg.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Center(
            child: Text(
              'SOUQ JUMLA',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
