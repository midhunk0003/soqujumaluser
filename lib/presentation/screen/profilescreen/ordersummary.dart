import 'package:customersouqjumla/presentation/screen/homescreen/widgets/subheadingwidgets.dart';
import 'package:customersouqjumla/presentation/widgets/appbarreusable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Ordersummary extends StatelessWidget {
  const Ordersummary({Key? key}) : super(key: key);

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
        automaticallyImplyLeading1: true,
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool isDelevered = true;
            bool isTablet = constraints.maxWidth > 600;
            return Column(
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
                      ? const EdgeInsets.only(left: 50, right: 50)
                      : const EdgeInsets.only(left: 25, right: 25),
                  child: Text(
                    'Order Summary',
                    style: TextStyle(
                      fontSize: isTablet ? 32 : 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: isTablet
                      ? const EdgeInsets.only(left: 50, right: 50)
                      : const EdgeInsets.only(left: 25, right: 25),
                  child: Container(
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
                          offset:
                              Offset(3, 3), // The position of the shadow (x, y)
                        )
                      ],
                    ),
                    child: Padding(
                      padding: isTablet
                          ? const EdgeInsets.all(40)
                          : const EdgeInsets.all(20),
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
                                        isTablet: isTablet,
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      myorderdetailswidget(
                                        title: 'Ordered on',
                                        subTitle: '03-01-2024   11:58AM',
                                        isTablet: isTablet,
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      myorderdetailswidget(
                                        title: 'Order Details',
                                        subTitle: '05 items - AED 200',
                                        isTablet: isTablet,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: isTablet ? 400 : 200,
                                width: 2,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: isTablet ? 50 : 25,
                              ),
                              Expanded(
                                child: Container(
                                  // color: Colors.green,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      myorderdetailswidget(
                                        title: 'Supermarket',
                                        subTitle: 'West Zone',
                                        isTablet: isTablet,
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      myorderdetailswidget(
                                        title: isDelevered == false
                                            ? 'Delivered on'
                                            : 'Delivery by',
                                        subTitle: isDelevered == false
                                            ? '03-01-2024   02:00PM'
                                            : 'Today at 08:00PM',
                                        isDeleavered: isDelevered == false,
                                        isTablet: isTablet,
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      myorderdetailswidget(
                                        title: 'Delivery Address',
                                        subTitle:
                                            'No, 4, Avenue Bazar,Cross road, Jumeirah,Dubai. 500006',
                                        isTablet: isTablet,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          // SizedBox(
                          //   height: 30,
                          // ),
                          Column(
                            children: [
                              Container(
                                color: const Color.fromARGB(255, 15, 153, 163),
                                child: Table(
                                  columnWidths: {
                                    0: FixedColumnWidth(
                                      isTablet ? 300.0 : 147.0,
                                    ), // Adjust the width of the first column
                                  },
                                  // defaultColumnWidth: FixedColumnWidth(120.0),
                                  border: TableBorder(
                                    horizontalInside: BorderSide(
                                      color: Colors.grey,
                                      style: BorderStyle.solid,
                                      width: 2,
                                    ),
                                    verticalInside: BorderSide(
                                      color: Colors.grey,
                                      style: BorderStyle.solid,
                                      width: 2,
                                    ),
                                    bottom: BorderSide(
                                      color: Colors.grey,
                                      style: BorderStyle.solid,
                                      width: 2,
                                    ),
                                  ),
                                  children: [
                                    TableRow(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Item',
                                              style: TextStyle(
                                                  fontSize:
                                                      isTablet ? 40 : 20.0),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text('Qty',
                                                style: TextStyle(
                                                    fontSize:
                                                        isTablet ? 40 : 20.0))
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text('Amount',
                                                style: TextStyle(
                                                    fontSize:
                                                        isTablet ? 40 : 20.0))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Table(
                                    columnWidths: {
                                      0: FixedColumnWidth(
                                        isTablet ? 300 : 147.0,
                                      ), // Adjust the width of the first column
                                    },
                                    // defaultColumnWidth: FixedColumnWidth(120.0),
                                    border: TableBorder(
                                      horizontalInside: BorderSide(
                                        color: Colors.grey,
                                        style: BorderStyle.solid,
                                        width: 2,
                                      ),
                                      verticalInside: BorderSide(
                                        color: Colors.grey,
                                        style: BorderStyle.solid,
                                        width: 2,
                                      ),
                                      bottom: BorderSide(
                                        color: Colors.grey,
                                        style: BorderStyle.solid,
                                        width: 2,
                                      ),
                                    ),
                                    children: [
                                      TableRow(
                                        children: [
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text('Apple',
                                                      style: TextStyle(
                                                          fontSize: isTablet
                                                              ? 26
                                                              : 13.0)),
                                                )
                                              ]),
                                          Column(children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text('3.5 Kg',
                                                  style: TextStyle(
                                                      fontSize: isTablet
                                                          ? 26
                                                          : 13.0)),
                                            )
                                          ]),
                                          Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text('AED 50.75',
                                                    style: TextStyle(
                                                        fontSize: isTablet
                                                            ? 26
                                                            : 13.0)),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),

                              //total table

                              Container(
                                color: const Color.fromARGB(255, 15, 153, 163),
                                child: Table(
                                  // defaultColumnWidth: FixedColumnWidth(120.0),
                                  border: TableBorder(),
                                  children: [
                                    TableRow(
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Total Expenses',
                                                style: TextStyle(
                                                    fontSize:
                                                        isTablet ? 24 : 16.0),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text('AED 261',
                                                  style: TextStyle(
                                                      fontSize: isTablet
                                                          ? 24
                                                          : 16.0)),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Total Discounts',
                                                style: TextStyle(
                                                    fontSize:
                                                        isTablet ? 24 : 16.0),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text('AED 61',
                                                  style: TextStyle(
                                                      fontSize: isTablet
                                                          ? 28
                                                          : 16.0)),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              ///grand total
                              Divider(),

                              Table(
                                columnWidths: {
                                  0: FixedColumnWidth(
                                    147.0,
                                  ), // Adjust the width of the first column
                                },
                                // defaultColumnWidth: FixedColumnWidth(120.0),
                                border: TableBorder(),
                                children: [
                                  TableRow(
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Grand Total',
                                              style: TextStyle(
                                                  fontSize:
                                                      isTablet ? 24 : 16.0,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('AED 200',
                                                style: TextStyle(
                                                    fontSize:
                                                        isTablet ? 24 : 16.0,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                ///buttonss
                ///
                ///
                Padding(
                  padding: isTablet
                      ? const EdgeInsets.only(left: 50, right: 50)
                      : const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            print("Index");
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 36,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.green,
                            ),
                            child: Center(
                              child: Text(
                                "Back to Order",
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
                            isDelevered == true
                                ? print("complaints")
                                : print("cancle order");
                          },
                          child: Container(
                            height: 36,
                            decoration: BoxDecoration(
                              color: isDelevered == true
                                  ? Colors.orange
                                  : Colors.yellow,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  isDelevered == true
                                      ? Icon(
                                          Icons.phone,
                                          color: Colors.white,
                                        )
                                      : Icon(
                                          Icons.close,
                                        ),
                                  isDelevered == true
                                      ? Text(
                                          "Complaints",
                                          style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        )
                                      : Text(
                                          "Cancle Order",
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 35,
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
  final bool isTablet;
  const myorderdetailswidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.isDeleavered,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "$title",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: isTablet ? 28 : 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 6,
              ),
              isDeleavered == false
                  ? Expanded(
                      child: Container(
                        width: isTablet ? 100 : 52,
                        height: isTablet ? 28 : 14,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: isTablet ? 4 : 2,
                            ),
                            Center(
                              child: Text(
                                "Active",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isTablet ? 20 : 10),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : SizedBox()
            ],
          ),
          Text(
            "$subTitle",
            style: TextStyle(
              color: Colors.black,
              fontSize: isTablet ? 26 : 13,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      );
    });
  }
}
