// import 'package:customersouqjumla/presentation/screen/cartscreen/cartscreen.dart';
// import 'package:customersouqjumla/presentation/screen/homescreen/homescreen.dart';
// import 'package:customersouqjumla/presentation/screen/likedscreen/likedscreen.dart';
// import 'package:customersouqjumla/presentation/screen/profilescreen/profilescreen.dart';
// import 'package:flutter/material.dart';

// class Bottomnavbar extends StatefulWidget {
//   const Bottomnavbar({Key? key}) : super(key: key);

//   @override
//   _BottomnavbarState createState() => _BottomnavbarState();
// }

// class _BottomnavbarState extends State<Bottomnavbar> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   final List<Widget> _widgetoption = [
//     // Homescreen(),
//     Likedscreen(),
//     Cartscreen(),
//     Profilescreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _widgetoption[_selectedIndex],
//       ),
//       bottomNavigationBar: AnimatedBottomNavBar(
//         selectedIndex: _selectedIndex,
//         onItemTapped: _onItemTapped,
//       ),
//     );
//   }
// }

// class AnimatedBottomNavBar extends StatelessWidget {
//   final int selectedIndex;
//   final ValueChanged<int> onItemTapped;

//   const AnimatedBottomNavBar({
//     super.key,
//     required this.selectedIndex,
//     required this.onItemTapped,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       // curve: Curves.easeInOut,
//       height: 94.0,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: const Color.fromARGB(255, 20, 20, 20).withOpacity(0.1),
//             spreadRadius: 2,
//             blurRadius: 8,
//             offset: const Offset(0, -2),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(left: 36, right: 36),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             CustomNavDestination(
//               imageAssetnoline: 'assets/images/iconimage/homeicon.png',
//               imageAssetblackline: 'assets/images/iconimage/homelineblack.png',
//               title: 'Home',
//               isSelected: selectedIndex == 0,
//               onTap: () => onItemTapped(0),
//             ),
//             CustomNavDestination(
//               imageAssetnoline: 'assets/images/iconimage/heartnoblack.png',
//               imageAssetblackline: 'assets/images/iconimage/heartblack.png',
//               title: 'Liked',
//               isSelected: selectedIndex == 1,
//               onTap: () => onItemTapped(1),
//             ),
//             CustomNavDestination(
//               imageAssetnoline: 'assets/images/iconimage/cartnoblack.png',
//               imageAssetblackline: 'assets/images/iconimage/cartblack.png',
//               title: 'Cart',
//               isSelected: selectedIndex == 2,
//               onTap: () => onItemTapped(2),
//             ),
//             CustomNavDestination(
//               imageAssetnoline: 'assets/images/iconimage/usernoblack.png',
//               imageAssetblackline: 'assets/images/iconimage/userblack.png',
//               title: 'Profile',
//               isSelected: selectedIndex == 3,
//               onTap: () => onItemTapped(3),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomNavDestination extends StatelessWidget {
//   final String title;
//   final String imageAssetnoline;
//   final String imageAssetblackline;
//   final bool isSelected;
//   final VoidCallback onTap;

//   const CustomNavDestination({
//     required this.imageAssetnoline,
//     required this.imageAssetblackline,
//     required this.title,
//     required this.isSelected,
//     required this.onTap,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 500),
//         width: isSelected ? 100 : 40,
//         height: 40,
//         // width: isSelected ? 120 : 60,
//         decoration: BoxDecoration(
//           color: isSelected
//               ? const Color.fromARGB(255, 21, 185, 48)
//               : Colors.transparent,
//           borderRadius: BorderRadius.circular(30),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Flexible(
//               child: Image.asset(
//                 isSelected ? imageAssetnoline : imageAssetblackline,
//               ),
//             ),
//             if (isSelected)
//               Flexible(
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 8.0),
//                   child: Text(
//                     title,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

// // String? _initialRoute;
// //   String? token;

// //   @override
// //   void initState() {
// //     // TODO: implement initState

// //     super.initState();
// //     _initialRoute;
// //     _initilizeRouteApp();
// //   }

// //   Future<String?> _getToken() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     return prefs.getString('auth_token');
// //   }

// //   Future<void> _initilizeRouteApp() async {
// //     final token = await _getToken();

// //     if (token != null) {
// //       // If token exists, redirect to EnterLocationScreen
// //       setState(() {
// //         print('token $token');
// //         _initialRoute = '/enterlocation';
// //         print('initi al route : ${_initialRoute}');
// //       });
// //     } else {
// //       print('no token');
// //       setState(() {
// //         _initialRoute = '/';
// //       });
// //     }
// //   }
// }
