import 'package:customersouqjumla/presentation/provider/helpandsupportprovider/faqprovider.dart';
import 'package:customersouqjumla/presentation/provider/homeprovider/bottomsheet_qty_change_provider.dart';
import 'package:customersouqjumla/presentation/provider/homeprovider/homeccarouselprovider.dart';
import 'package:customersouqjumla/presentation/provider/onboardprovider/onboardprovider.dart';
import 'package:customersouqjumla/presentation/screen/authscreen/loginphonenumber.dart';
import 'package:customersouqjumla/presentation/screen/authscreen/validateotp.dart';
import 'package:customersouqjumla/presentation/screen/cartscreen/addresscart.dart';
import 'package:customersouqjumla/presentation/screen/enterlocationscreen/enterlocationscreen.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/homescreen.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/homesubcategory.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/widgets/tracker_ruler_widget_items.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/widgets/trackers_ruler_widget.dart';
import 'package:customersouqjumla/presentation/screen/notificationscreen/notificationscreen.dart';
import 'package:customersouqjumla/presentation/screen/onboardingscreen/onboardingscreen_one.dart';
import 'package:customersouqjumla/presentation/screen/profilescreen/aboutus.dart';
import 'package:customersouqjumla/presentation/screen/profilescreen/contact.dart';
import 'package:customersouqjumla/presentation/screen/profilescreen/faqs.dart';
import 'package:customersouqjumla/presentation/screen/profilescreen/helpandsupport.dart';
import 'package:customersouqjumla/presentation/screen/profilescreen/myorder.dart';
import 'package:customersouqjumla/presentation/screen/profilescreen/ordersummary.dart';
import 'package:customersouqjumla/presentation/screen/profilescreen/personaldetails.dart';
import 'package:customersouqjumla/presentation/screen/profilescreen/registerandcomplaints.dart';
import 'package:customersouqjumla/presentation/screen/selectstorescreen/selectstorescreen.dart';
import 'package:customersouqjumla/presentation/widgets/bottomnavbar.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  num selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => OnboardingProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CarouselProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => BottomSheetQtyProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FaqProvider(),
        )
      ],
      child: MaterialApp(
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
              return _createRoute(const OnboardingscreenOne());

            // MaterialPageRoute(
            //   builder: (context) => const OnboardingscreenOne(),
            // );
            case '/loginphonenumber':
              return _createRoute(Loginphonenumber());
            // MaterialPageRoute(
            //   builder: (context) => Loginphonenumber(),
            // );
            case '/verifyOtp':
              return _createRoute(ValidateOtp());
            // MaterialPageRoute(
            //   builder: (context) => ValidateOtp(),
            // );
            case '/enterlocation':
              return _createRoute(Enterlocationscreen());
            // MaterialPageRoute(
            //   builder: (context) => Enterlocationscreen(),
            // );
            case '/selectstorescreen':
              return _createRoute(Selectstorescreen());
            // MaterialPageRoute(
            //   builder: (context) => const Selectstorescreen(),
            // );

            case '/homescreen':
              return _createRoute(Homescreen());
            // MaterialPageRoute(
            //   builder: (context) => Homescreen(),
            // );
            case '/bottomnavbar':
              return _createRoute(Bottomnavbar());
            // MaterialPageRoute(
            //   builder: (context) => const Bottomnavbar(),
            // );
            case '/Homesubcategory':
              return _createRoute(Homesubcategory());
            // MaterialPageRoute(
            //   builder: (context) => const Homesubcategory(),
            // );
            case '/AddressCart':
              return _createRoute(Addresscart());
            // MaterialPageRoute(
            //   builder: (context) => Addresscart(),
            // );
            case '/personaldetails':
              return _createRoute(Personaldetails());
            // MaterialPageRoute(
            //   builder: (context) => Personaldetails(),
            // );
            case '/myorders':
              return _createRoute(Myorder());
            // MaterialPageRoute(
            //   builder: (context) => Myorder(),
            // );
            case '/ordersummary':
              return _createRoute(Ordersummary());
            // MaterialPageRoute(
            //   builder: (context) => Ordersummary(),
            // );
            case '/aboutus':
              return _createRoute(Aboutus());
            // MaterialPageRoute(
            //   builder: (context) => Aboutus(),
            // );
            case '/helpandsupport':
              return _createRoute(Helpandsupport());
            // MaterialPageRoute(
            //   builder: (context) => Helpandsupport(),
            // );
            case '/contact':
              return _createRoute(Contact());
            // MaterialPageRoute(
            //   builder: (context) => Contact(),
            // );
            case '/Registerandcomplaints':
              return _createRoute(Registerandcomplaints());
            // MaterialPageRoute(
            //   builder: (context) => Registerandcomplaints(),
            // );
            case '/faqs':
              return _createRoute(Faqs());
            // MaterialPageRoute(
            //   builder: (context) => Faqs(),
            // );
            case '/notification':
              return _createRoute(
                Notificationscreen(),
              );
            default:
            // return MaterialPageRoute(builder: (context) => NotFoundScreen());
          }
          return null;
        },
        // home: ValidateOtp(),
      ),
    );
  }
}

Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
