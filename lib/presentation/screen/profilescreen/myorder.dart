import 'package:customersouqjumla/presentation/screen/homescreen/widgets/subheadingwidgets.dart';
import 'package:customersouqjumla/presentation/widgets/appbarreusable.dart';
import 'package:flutter/material.dart';

class Myorder extends StatelessWidget {
  const Myorder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<bool> isDelevered = [true, false, false, true];

    return Scaffold(
      appBar: CustomAppBar(
        title: Image(
          width: 92,
          image: AssetImage(
            'assets/images/logo.png',
          ),
        ),
        automaticallyImplyLeading1: true,
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),
                subheadingwidget(
                  heading: "My Orders",
                  isTablet: isTablet,
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: isTablet
                      ? const EdgeInsets.only(left: 25, right: 25)
                      : const EdgeInsets.only(left: 25, right: 25),
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          // height: 268,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 245, 245, 245),
                            // color: Colors.yellow,
                            border: Border.all(width: 1, color: Colors.green),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 0, 0, 0)
                                    .withOpacity(0.5), // Shadow color
                                spreadRadius: -3, // How much the shadow spreads
                                blurRadius: 9, // The blur effect (softness)
                                offset: Offset(
                                    3, 3), // The position of the shadow (x, y)
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        // color: Colors.amber,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            myorderdetailswidget(
                                              title: 'Order Number',
                                              subTitle: 'WT0745698542',
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            myorderdetailswidget(
                                              title: 'Order Number',
                                              subTitle: 'WT0745698542',
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            myorderdetailswidget(
                                              title: 'Order Number',
                                              subTitle: 'WT0745698542',
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    // VerticalDivider(
                                    //   color: Colors.grey,
                                    //   thickness: 2,
                                    //   width:
                                    //       20, // Space between the divider and the widgets
                                    // ),
                                    Expanded(
                                      child: Container(
                                        // color: Colors.green,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            myorderdetailswidget(
                                              title: 'Order Number',
                                              subTitle: 'WT0745698542',
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            myorderdetailswidget(
                                              title: isDelevered[index]
                                                  ? 'Delivered on'
                                                  : 'Delivery by',
                                              subTitle: isDelevered[index]
                                                  ? '03-01-2024   02:00PM'
                                                  : 'Today at 08:00PM',
                                              isDeleavered: isDelevered[index],
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            myorderdetailswidget(
                                              title: 'Order Number',
                                              subTitle: 'WT0745698542',
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Divider(
                                  thickness: 2,
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          print("Index");
                                          Navigator.pushNamed(
                                              context, '/ordersummary');
                                        },
                                        child: Container(
                                          height: 36,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Colors.green,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Order summary",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          isDelevered[index] == true
                                              ? print("complaints")
                                              : print("cancle order");
                                        },
                                        child: Container(
                                          height: 36,
                                          decoration: BoxDecoration(
                                            color: isDelevered[index] == true
                                                ? Colors.orange
                                                : Colors.yellow,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                isDelevered[index] == true
                                                    ? Icon(
                                                        Icons.phone,
                                                        color: Colors.white,
                                                      )
                                                    : Icon(
                                                        Icons.close,
                                                      ),
                                                isDelevered[index] == true
                                                    ? Text(
                                                        "Complaints",
                                                        style: TextStyle(
                                                            color: const Color
                                                                .fromARGB(255,
                                                                255, 255, 255),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      )
                                                    : Text(
                                                        "Cancle Order",
                                                        style: TextStyle(
                                                            color: const Color
                                                                .fromARGB(
                                                                255, 0, 0, 0),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 25,
                        );
                      },
                      itemCount: isDelevered.length),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class myorderdetailswidget extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final bool? isDeleavered;
  const myorderdetailswidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.isDeleavered,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "$title",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 6,
            ),
            isDeleavered == false
                ? Container(
                    width: 52,
                    height: 14,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 2,
                        ),
                        Center(
                          child: Text(
                            "Active",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  )
                : SizedBox()
          ],
        ),
        Text(
          "$subTitle",
          style: TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
