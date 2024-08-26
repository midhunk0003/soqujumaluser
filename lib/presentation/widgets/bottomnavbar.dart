import 'package:customersouqjumla/presentation/screen/cartscreen/cartscreen.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/homescreen.dart';
import 'package:customersouqjumla/presentation/screen/likedscreen/likedscreen.dart';
import 'package:customersouqjumla/presentation/screen/profilescreen/profilescreen.dart';
import 'package:flutter/material.dart';

class Bottomnavbar extends StatefulWidget {
  // final int initalIndex;
  const Bottomnavbar({
    Key? key,
  }) : super(key: key);

  @override
  _BottomnavbarState createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    // _selectedIndex = 2;
    _pageController = PageController(initialPage: _selectedIndex);
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
    print(index);
  }

  final List<Widget> _widgetoption = [
    Homescreen(),
    Likedscreen(),
    Cartscreen(),
    Profilescreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        // duration: Duration(milliseconds: 500),
        // transitionBuilder: (Widget child, Animation<double> animation) {
        //   return ScaleTransition(
        //     scale: animation,
        //     child: child,
        //   );
        // },
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        physics: NeverScrollableScrollPhysics(),
        children: [
          IndexedStack(
            index: _selectedIndex,
            children: _widgetoption,
          ),
        ],
      ),
      bottomNavigationBar: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedBottomNavBar(
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
            isTablet: constraints.maxWidth > 600, // Check for tablet width
          );
        },
      ),
    );
  }
}

class AnimatedBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;
  final bool isTablet;

  const AnimatedBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isTablet ? 120.0 : 94.0, // Adjust height based on device
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 20, 20, 20).withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isTablet ? 48.0 : 36.0, // Adjust padding based on device
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomNavDestination(
              imageAssetnoline: 'assets/images/iconimage/homeicon.png',
              imageAssetblackline: 'assets/images/iconimage/homelineblack.png',
              title: 'Home',
              indexxxxx: 0,
              isSelected: selectedIndex == 0,
              onTap: () => onItemTapped(0),
              isTablet: isTablet,
            ),
            CustomNavDestination(
              imageAssetnoline: 'assets/images/iconimage/heartnoblack.png',
              imageAssetblackline: 'assets/images/iconimage/heartblack.png',
              title: 'Liked',
              indexxxxx: 1,
              isSelected: selectedIndex == 1,
              onTap: () => onItemTapped(1),
              isTablet: isTablet,
            ),
            CustomNavDestination(
              imageAssetnoline: 'assets/images/iconimage/cartnoblack.png',
              imageAssetblackline: 'assets/images/iconimage/cartblack.png',
              title: 'Cart',
              indexxxxx: 2,
              isSelected: selectedIndex == 2,
              onTap: () => onItemTapped(2),
              isTablet: isTablet,
            ),
            CustomNavDestination(
              imageAssetnoline: 'assets/images/iconimage/usernoblack.png',
              imageAssetblackline: 'assets/images/iconimage/userblack.png',
              title: 'Profile',
              indexxxxx: 3,
              isSelected: selectedIndex == 3,
              onTap: () => onItemTapped(3),
              isTablet: isTablet,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomNavDestination extends StatelessWidget {
  final String title;
  final int indexxxxx;
  final String imageAssetnoline;
  final String imageAssetblackline;
  final bool isSelected;
  final bool isTablet;
  final VoidCallback onTap;

  const CustomNavDestination({
    required this.imageAssetnoline,
    required this.imageAssetblackline,
    required this.title,
    required this.indexxxxx,
    required this.isSelected,
    required this.onTap,
    required this.isTablet,
    Key? key,
  }) : super(key: key);

  final int cerindex = 1;
  final int cerindex2 = 2;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: isSelected ? (isTablet ? 150 : 100) : 40, // Adjust width
            height: 40,
            decoration: BoxDecoration(
              // color: Colors.red,
              color: isSelected
                  ? const Color.fromARGB(255, 21, 185, 48)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Image.asset(
                    isSelected ? imageAssetnoline : imageAssetblackline,
                  ),
                ),
                if (isSelected)
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isTablet ? 14 : 12, // Adjust font size
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (indexxxxx == cerindex || indexxxxx == cerindex2)
            Positioned(
              right: isSelected ? 12 : 0,
              left: isSelected ? 0 : 25,
              bottom: isSelected ? 20 : 20,
              child: (1 == 1)
                  ? const CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 8,
                      child: Center(
                        child: Text(
                          '2',
                          style: TextStyle(color: Colors.white, fontSize: 9),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  : Container(),
            ),
        ],
      ),
    );
  }
}
