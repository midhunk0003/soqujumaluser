import 'package:flutter/material.dart';

class OnboardingscreenOne extends StatelessWidget {
  OnboardingscreenOne({Key? key}) : super(key: key);
  final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  final List<Map<String, dynamic>> _onboardingData = [
    {
      'title': 'Groceries, Delivered\nto Your Doorstep',
      'image': 'assets/images/onbord1.jpeg',
    },
    {
      'title': 'Simplify Shopping,\nAmplify Freshness',
      'image': 'assets/images/obbord2.jpeg',
    },
    {
      'title': 'Where Quality\nMeets Convenience.',
      'image': 'assets/images/onbord3.jpeg',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        bool isTablet = constraints.maxWidth > 600;
        return Stack(
          children: [
            ValueListenableBuilder<int>(
              valueListenable: currentIndex,
              builder: (BuildContext context, int index, _) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage(
                        _onboardingData[index]['image'],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
            Container(
              width: double.infinity,
              color:
                  Colors.black.withOpacity(0.7), // Adjust the opacity as needed
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: isTablet ? 100 : 80,
                    decoration: BoxDecoration(
                        // color: Colors.green,
                        ),
                    child: IntrinsicHeight(
                        child: ValueListenableBuilder<int>(
                            valueListenable: currentIndex,
                            builder: (context, index, _) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: isTablet ? 25 : 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AnimatedSwitcher(
                                            duration:
                                                Duration(milliseconds: 600),
                                            transitionBuilder: (Widget child,
                                                Animation<double> animation) {
                                              return FadeTransition(
                                                opacity: animation,
                                                child: child,
                                              );
                                            },
                                            child: Text(
                                              _onboardingData[index]['title'],
                                              key: ValueKey<int>(index),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: isTablet ? 36 : 26,
                                                height: 1.2,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: List.generate(
                                                _onboardingData.length,
                                                (index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8),
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  width: index ==
                                                          currentIndex.value
                                                      ? (isTablet ? 64 : 44)
                                                      : (isTablet
                                                          ? 34
                                                          : 24), // Change width based on index
                                                  height: 4,
                                                  decoration: BoxDecoration(
                                                    color: index ==
                                                            currentIndex.value
                                                        ? Color.fromARGB(
                                                            255, 9, 201, 66)
                                                        : Colors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                ),
                                              );
                                            }),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        if (currentIndex.value == 2) {
                                          print("123");
                                          Navigator.pushNamed(
                                              context, '/loginphonenumber');
                                        }
                                        currentIndex.value =
                                            (currentIndex.value + 1) %
                                                _onboardingData.length;
                                        print("${currentIndex}");
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 34),
                                        // width: 92,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(39),
                                            bottomLeft: Radius.circular(39),
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.green,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            })),
                  ),
                  SizedBox(height: 80),
                ],
              ),
            ),
          ],
        );
      },
    ));
  }
}
