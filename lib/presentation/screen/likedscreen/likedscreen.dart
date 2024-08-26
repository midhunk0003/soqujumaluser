import 'package:customersouqjumla/presentation/screen/homescreen/widgets/subheadingwidgets.dart';
import 'package:customersouqjumla/presentation/widgets/appbarreusable.dart';
import 'package:customersouqjumla/presentation/widgets/bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Likedscreen extends StatelessWidget {
  const Likedscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Image(
          width: 92,
          image: AssetImage(
            'assets/images/logo.png',
          ),
        ),
        automaticallyImplyLeading1: false,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet = constraints.maxWidth > 600;
          return SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  subheadingwidget(
                    heading: "Liked",
                    isTablet: isTablet,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: isTablet
                        ? const EdgeInsets.only(left: 50, right: 50)
                        : const EdgeInsets.only(left: 25, right: 25),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 100,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          height: isTablet ? 160 : 90,
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.8, color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                              child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: isTablet ? 200 : 100,
                                decoration: BoxDecoration(
                                  // color: Colors.amber,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/vegitables.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Apple",
                                    style: TextStyle(
                                        fontSize: isTablet ? 28 : 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "By weight AED 14.50/ KG",
                                    style:
                                        TextStyle(fontSize: isTablet ? 22 : 11),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  showscrollingBottomsheet(context, index);
                                },
                                child: Container(
                                  height: isTablet ? 70 : 56,
                                  width: isTablet ? 70 : 56,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black
                                            .withOpacity(0.5), // Shadow color
                                        blurRadius: 8, // Blur radius
                                        spreadRadius: 1, // Spread radius
                                        offset: Offset(4,
                                            4), // Offset in X and Y directions
                                      )
                                    ],
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                        'assets/images/iconimage/cartnoblack.png'),
                                  ),
                                ),
                              ),
                            ],
                          )

                              //  ListTile(
                              //   // contentPadding: EdgeInsets.symmetric(
                              //   //     vertical: 10, horizontal: 16.0),
                              //   leading: Container(
                              //     // height: isTablet ? 200 : 80,
                              //     width: isTablet ? 200 : 100,
                              //     decoration: BoxDecoration(
                              //       color: Colors.amber,
                              //       image: DecorationImage(
                              //         image: AssetImage(
                              //             'assets/images/vegitables.png'),
                              //         fit: BoxFit.cover,
                              //       ),
                              //     ),
                              //   ),
                              //   title: Text(
                              //     "Apple",
                              //     style: TextStyle(
                              //         fontSize: isTablet ? 28 : 14,
                              //         fontWeight: FontWeight.w500),
                              //   ),
                              //   subtitle: Text(
                              //     "By weight AED 14.50/ KG",
                              //     style: TextStyle(fontSize: isTablet ? 22 : 11),
                              //   ),
                              //   trailing: InkWell(
                              //     onTap: () {
                              //       showscrollingBottomsheet(context, index);
                              //     },
                              //     child: Container(
                              //       height: isTablet ? 70 : 56,
                              //       width: isTablet ? 70 : 56,
                              //       decoration: BoxDecoration(
                              //         boxShadow: [
                              //           BoxShadow(
                              //             color: Colors.black
                              //                 .withOpacity(0.5), // Shadow color
                              //             blurRadius: 8, // Blur radius
                              //             spreadRadius: 2, // Spread radius
                              //             offset: Offset(4,
                              //                 4), // Offset in X and Y directions
                              //           )
                              //         ],
                              //         color: Colors.green,
                              //         borderRadius: BorderRadius.circular(12),
                              //       ),
                              //       child: Center(
                              //         child: Image.asset(
                              //             'assets/images/iconimage/cartnoblack.png'),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: isTablet ? 30 : 15,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
