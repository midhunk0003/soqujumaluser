import 'package:customersouqjumla/presentation/provider/notificationprovider/notificationchangiconprovider.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/widgets/subheadingwidgets.dart';
import 'package:customersouqjumla/presentation/widgets/appbarreusable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class Notificationscreen extends StatelessWidget {
  const Notificationscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (willPop, result) {
        Provider.of<Notificationchangiconprovider>(context, listen: false)
            .changeIcon(true);
      },
      child: Scaffold(
        appBar: const CustomAppBar(
          title: Image(
            width: 92,
            image: AssetImage(
              'assets/images/logo.png',
            ),
          ),
          // actions: false,
          automaticallyImplyLeading1: true,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600;
            return Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                subheadingwidget(
                  heading: "Notification",
                  isTablet: isTablet,
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      // return Text("1212");
                      return Stack(
                        children: [
                          Container(
                            // height: 80,
                            // width: 340,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  const Expanded(
                                    flex: 4,
                                    child: Text(
                                        "New offers available at VIVA Supermarket! Don't miss out, hurry and grab your deals at affordable prices."),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 60,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/Rectangle 638.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 5,
                            top: 4,
                            // right: 0,
                            child: CircleAvatar(
                              radius: 4,
                              backgroundColor: Colors.green,
                            ),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, constraints) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: 3,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
