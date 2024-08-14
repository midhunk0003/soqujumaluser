import 'package:customersouqjumla/presentation/screen/authscreen/loginphonenumber.dart';
import 'package:customersouqjumla/presentation/screen/authscreen/validateotp.dart';
import 'package:customersouqjumla/presentation/screen/enterlocationscreen/enterlocationscreen.dart';
import 'package:customersouqjumla/presentation/screen/onboardingscreen/onboardingscreen_one.dart';
import 'package:customersouqjumla/presentation/screen/selectstorescreen/selectstorescreen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'customersouqjumla',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: OnboardingscreenOne(),
      // home: Loginphonenumber(),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
                builder: (context) => OnboardingscreenOne());
          case '/loginphonenumber':
            return MaterialPageRoute(
              builder: (context) => Loginphonenumber(),
            );
          case '/verifyOtp':
            return MaterialPageRoute(
              builder: (context) => ValidateOtp(),
            );
          case '/enterlocation':
            return MaterialPageRoute(
                builder: (context) => Enterlocationscreen());
          case '/selectstorescreen':
            return MaterialPageRoute(builder: (context) => Selectstorescreen());
          default:
          // return MaterialPageRoute(builder: (context) => NotFoundScreen());
        }
      },
      // home: ValidateOtp(),
    );
  }
}
