import 'package:customersouqjumla/domain/dependence_injection/injectable.dart';
import 'package:customersouqjumla/presentation/provider/authprovider/loginprovider.dart';
import 'package:customersouqjumla/presentation/provider/cartprovider/cart_provider.dart';
import 'package:customersouqjumla/presentation/provider/delete_provider/deleteprovider.dart';
import 'package:customersouqjumla/presentation/provider/enterlocationprovider/enterlocationsprovider.dart';
import 'package:customersouqjumla/presentation/provider/helpandsupportprovider/faqprovider.dart';
import 'package:customersouqjumla/presentation/provider/homeprovider/bottomsheet_qty_change_provider.dart';
import 'package:customersouqjumla/presentation/provider/homeprovider/category_by_product_provider.dart';
import 'package:customersouqjumla/presentation/provider/homeprovider/category_provider.dart';
import 'package:customersouqjumla/presentation/provider/homeprovider/homeccarouselprovider.dart';
import 'package:customersouqjumla/presentation/provider/likedproductprovider/likedproductprovider.dart';
import 'package:customersouqjumla/presentation/provider/notificationprovider/notificationchangiconprovider.dart';
import 'package:customersouqjumla/presentation/provider/onboardprovider/onboardprovider.dart';
import 'package:customersouqjumla/presentation/provider/placeorder/placeorderprovider.dart';
import 'package:customersouqjumla/presentation/provider/profileprovider/profileprovider.dart';
import 'package:customersouqjumla/presentation/provider/selectstoreprovider/selectstoreprovider.dart';
import 'package:customersouqjumla/presentation/screen/authscreen/loginphonenumber.dart';
import 'package:customersouqjumla/presentation/screen/authscreen/validateotp.dart';
import 'package:customersouqjumla/presentation/screen/cartscreen/addresscart.dart';
import 'package:customersouqjumla/presentation/screen/cartscreen/cartscreen.dart';
import 'package:customersouqjumla/presentation/screen/enterlocationscreen/enterlocationscreen.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/homescreen.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/homesubcategory.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/widgets/tracker_ruler_widget_items.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/widgets/trackers_ruler_widget.dart';
import 'package:customersouqjumla/presentation/screen/likedscreen/likedscreen.dart';
import 'package:customersouqjumla/presentation/screen/notificationscreen/notificationscreen.dart';
import 'package:customersouqjumla/presentation/screen/onboardingscreen/onboardingscreen_one.dart';
import 'package:customersouqjumla/presentation/screen/profilescreen/aboutus.dart';
import 'package:customersouqjumla/presentation/screen/profilescreen/contact.dart';
import 'package:customersouqjumla/presentation/screen/profilescreen/deleteacount.dart';
import 'package:customersouqjumla/presentation/screen/profilescreen/faqs.dart';
import 'package:customersouqjumla/presentation/screen/profilescreen/helpandsupport.dart';
import 'package:customersouqjumla/presentation/screen/profilescreen/myorder.dart';
import 'package:customersouqjumla/presentation/screen/profilescreen/ordersummary.dart';
import 'package:customersouqjumla/presentation/screen/profilescreen/personaldetails.dart';
import 'package:customersouqjumla/presentation/screen/profilescreen/profilescreen.dart';
import 'package:customersouqjumla/presentation/screen/profilescreen/registerandcomplaints.dart';
import 'package:customersouqjumla/presentation/screen/selectstorescreen/selectstorescreen.dart';
import 'package:customersouqjumla/presentation/screen/splashscreen/splashscreen.dart';
import 'package:customersouqjumla/presentation/widgets/bottomnavbar.dart';
import 'package:customersouqjumla/presentation/widgets/ruler_picker_custom.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configurationInjection();
  final prefs = await SharedPreferences.getInstance();
  // prefs.clear();
  final String? loginToken = prefs.getString('auth_token');
  print('Login Token: $loginToken');
  runApp(
    DevicePreview(
        builder: (context) => MyApp(
              initialRoute: '/',
            )),
    // const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final String? initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => OnboardingProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<Profileprovider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<CarouselProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => BottomSheetQtyProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FaqProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => Notificationchangiconprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<LoginProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<Enterlocationsprovider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<Selectstoreprovider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<CategoryProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<CategoryByProductProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<Likedproductprovider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<CartProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<DeleteAccountprovider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<Placeorderprovider>(),
        )
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'customersouqjumla',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: initialRoute,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return _createRoute(
                Splashscreen(),
                // const OnboardingscreenOne(),
              );
            case '/onboardingscreenone':
              return _createRoute(
                OnboardingscreenOne(),
              );

            case '/loginphonenumber':
              return _createRoute(
                Loginphonenumber(),
              );

            case '/verifyOtp':
              return _createRoute(
                ValidateOtp(),
              );

            case '/enterlocation':
              return _createRoute(
                Enterlocationscreen(),
                // RulerPickerScreen(),
              );

            case '/selectstorescreen':
              return _createRoute(
                Selectstorescreen(),
              );
            case '/bottomnavbar':
              final argus = settings.arguments as Map<String, dynamic>;
              final int? storeId = argus['storeId'];
              print("inside the route : $storeId");
              return _createRoute(
                Bottomnavbar(
                  storeId: storeId,
                ),
              );

            case '/Homesubcategory':
              final argus = settings.arguments as Map<String, dynamic>;
              final int? storeId = argus['storeid'];
              final int? categoryId = argus['categotyid'];
              print("inside the route : $storeId");
              print("inside the route : $categoryId");
              return _createRoute(
                Homesubcategory(
                  storeId: storeId,
                  categoryId: categoryId,
                ),
              );

            case '/AddressCart':
              final argus = settings.arguments as Map<String, dynamic>;
              final int? storeId = argus['storeId'];
              print("inside the route : $storeId");
              return _createRoute(
                Addresscart(
                  storeId: storeId,
                ),
              );

            case '/personaldetails':
              return _createRoute(
                Personaldetails(),
              );

            case '/myorders':
              return _createRoute(
                Myorder(),
              );

            case '/ordersummary':
              final argus = settings.arguments as Map<String, dynamic>;
              final int? orderId = argus['orderId'];
              return _createRoute(
                Ordersummary(
                  orderId: orderId,
                ),
              );

            case '/aboutus':
              return _createRoute(
                Aboutus(),
              );

            case '/helpandsupport':
              return _createRoute(
                Helpandsupport(),
              );

            case '/contact':
              return _createRoute(
                Contact(),
              );

            case '/Registerandcomplaints':
              return _createRoute(
                Registerandcomplaints(),
              );

            case '/faqs':
              return _createRoute(
                Faqs(),
              );

            case '/notification':
              return _createRoute(
                Notificationscreen(),
              );
            case '/deleteaccount':
              return _createRoute(
                DeleteAccount(),
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

      var tween = Tween(begin: begin, end: end).chain(
        CurveTween(curve: curve),
      );
      var offsetAnimation = animation.drive(tween);

      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
