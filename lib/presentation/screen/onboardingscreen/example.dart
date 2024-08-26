// import 'package:customersouqjumla/presentation/provider/onboardprovider/onboardprovider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class OnboardingscreenOne1 extends StatelessWidget {
//   OnboardingscreenOne1({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final onboardingProvider = Provider.of<OnboardingProvider>(context);
//     for (var data in onboardingProvider.onboardingData) {
//       precacheImage(AssetImage(data.image), context);
//     }
//     return Scaffold(
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           bool isTablet = constraints.maxWidth > 600;
//           return Stack(
//             children: [
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   image: DecorationImage(
//                     image: AssetImage(
//                       onboardingProvider
//                           .onboardingData[onboardingProvider.currentIndex]
//                           .image,
//                     ),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Container(
//                 width: double.infinity,
//                 color: Colors.black.withOpacity(0.7),
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Container(
//                       height: isTablet ? 100 : 80,
//                       child: IntrinsicHeight(
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: Padding(
//                                 padding:
//                                     EdgeInsets.only(left: isTablet ? 25 : 15),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     AnimatedSwitcher(
//                                       duration: Duration(milliseconds: 600),
//                                       transitionBuilder: (Widget child,
//                                           Animation<double> animation) {
//                                         return FadeTransition(
//                                           opacity: animation,
//                                           child: child,
//                                         );
//                                       },
//                                       child: Text(
//                                         onboardingProvider
//                                             .onboardingData[
//                                                 onboardingProvider.currentIndex]
//                                             .title,
//                                         key: ValueKey<int>(
//                                             onboardingProvider.currentIndex),
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: isTablet ? 36 : 26,
//                                           height: 1.2,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(height: 10),
//                                     Row(
//                                       children: List.generate(
//                                         onboardingProvider
//                                             .onboardingData.length,
//                                         (index) {
//                                           return Padding(
//                                             padding:
//                                                 const EdgeInsets.only(right: 8),
//                                             child: AnimatedContainer(
//                                               duration:
//                                                   Duration(milliseconds: 300),
//                                               width: index ==
//                                                       onboardingProvider
//                                                           .currentIndex
//                                                   ? (isTablet ? 64 : 44)
//                                                   : (isTablet ? 34 : 24),
//                                               height: 4,
//                                               decoration: BoxDecoration(
//                                                 color: index ==
//                                                         onboardingProvider
//                                                             .currentIndex
//                                                     ? Color.fromARGB(
//                                                         255, 9, 201, 66)
//                                                     : Colors.grey,
//                                                 borderRadius:
//                                                     BorderRadius.circular(12),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Align(
//                               alignment: Alignment.centerRight,
//                               child: GestureDetector(
//                                 onTap: () {
//                                   if (onboardingProvider.currentIndex ==
//                                       onboardingProvider.onboardingData.length -
//                                           1) {
//                                     Navigator.pushNamed(
//                                         context, '/loginphonenumber');
//                                   } else {
//                                     onboardingProvider.nextPage();
//                                   }
//                                 },
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(horizontal: 34),
//                                   height: double.infinity,
//                                   decoration: BoxDecoration(
//                                     color: Color.fromARGB(255, 255, 255, 255),
//                                     borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(39),
//                                       bottomLeft: Radius.circular(39),
//                                     ),
//                                   ),
//                                   child: Icon(
//                                     Icons.arrow_forward,
//                                     color: Colors.green,
//                                     size: 30,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 80),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
