import 'package:customersouqjumla/presentation/provider/placeorder/placeorderprovider.dart';
import 'package:customersouqjumla/presentation/provider/profileprovider/profileprovider.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/widgets/subheadingwidgets.dart';
import 'package:customersouqjumla/presentation/widgets/appbarreusable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Ordersummary extends StatefulWidget {
  final int? orderId;
  const Ordersummary({Key? key, required this.orderId}) : super(key: key);

  @override
  State<Ordersummary> createState() => _OrdersummaryState();
}

class _OrdersummaryState extends State<Ordersummary> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Placeorderprovider>(context, listen: false).getOrderSummary(
        widget.orderId.toString(),
      );
      Provider.of<Placeorderprovider>(context, listen: false)
          .getMyOrdersWithOrderId(
        widget.orderId.toString(),
      );
    });
    super.initState();
  }

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
      body: Consumer<Placeorderprovider>(
        builder: (context, placeOrderProvider, child) {
          // print(
          //     "get data by order id : ${placeOrderProvider.myorderWithOrderId!.length}");
          if (placeOrderProvider.isOrderSummaryloading == true) {
            return Center(
              child: Lottie.asset(
                'assets/json/loadingcircle.json',
                width: 200,
                height: 150,
                fit: BoxFit.fill,
              ),
            );
          } else if (placeOrderProvider.errorMessage != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${placeOrderProvider.errorMessage}"),
                  ElevatedButton(
                    onPressed: () {
                      placeOrderProvider
                          .getOrderSummary(widget.orderId.toString());
                    },
                    child: Text("Retry"),
                  )
                ],
              ),
            );
          } else if (placeOrderProvider.myorderWithOrderId == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text("${placeOrderProvider.errorMessage}")),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      placeOrderProvider.getMyOrders();
                    },
                    child: Text("Retry"),
                  )
                ],
              ),
            );
          }
          return SingleChildScrollView(
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
                              offset: Offset(
                                  3, 3), // The position of the shadow (x, y)
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
                                            subTitle:
                                                '${placeOrderProvider.myorderWithOrderId!.orderId}',
                                            isTablet: isTablet,
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          myorderdetailswidget(
                                            title: 'Ordered on',
                                            subTitle:
                                                '${placeOrderProvider.myorderWithOrderId!.orderDate}',
                                            isTablet: isTablet,
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          myorderdetailswidget(
                                            title: 'Order Details',
                                            subTitle:
                                                '${placeOrderProvider.myorderWithOrderId!.orderDetails} items - AED ${placeOrderProvider.grandTotal}',
                                            isTablet: isTablet,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: isTablet ? 400 : 200,
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                  // VerticalDivider(
                                  //   color: Colors.red,
                                  // ),
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
                                            subTitle:
                                                '${placeOrderProvider.myorderWithOrderId!.supermarketEng}',
                                            isTablet: isTablet,
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          myorderdetailswidget(
                                            title: placeOrderProvider
                                                        .myorderWithOrderId!
                                                        .isdelivered ==
                                                    false
                                                ? ''
                                                : 'Delivery by',
                                            subTitle: placeOrderProvider
                                                        .myorderWithOrderId!
                                                        .isdelivered ==
                                                    false
                                                ? ''
                                                : '',
                                            newOrder: placeOrderProvider
                                                .myorderWithOrderId!.isneworder,
                                            isDelevered: placeOrderProvider
                                                .myorderWithOrderId!
                                                .isdelivered,
                                            isorderCanceled: placeOrderProvider
                                                .myorderWithOrderId!
                                                .iscancelled,
                                            isTablet: isTablet,
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),

                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Deliverby Address"),
                                              Text(
                                                  "${placeOrderProvider.myorderWithOrderId!.customername}"),
                                              Text(
                                                "${placeOrderProvider.myorderWithOrderId!.block!.engTitle}",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                  "street : ${placeOrderProvider.myorderWithOrderId!.street}"),
                                              Text(
                                                  "avenue : ${placeOrderProvider.myorderWithOrderId!.avenue}"),
                                              Text(
                                                  "building : ${placeOrderProvider.myorderWithOrderId!.building}"),
                                              Text(
                                                  "floor : ${placeOrderProvider.myorderWithOrderId!.floor}"),
                                              Text(
                                                  "apartment : ${placeOrderProvider.myorderWithOrderId!.apartment}"),
                                            ],
                                          )
                                          // myorderdetailswidget(
                                          //   title: 'Delivery Address',
                                          //   subTitle:
                                          //       'No, 4, Avenue Bazar,Cross road, Jumeirah,Dubai. 500006',
                                          //   isTablet: isTablet,
                                          // ),
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
                                    color:
                                        const Color.fromARGB(85, 17, 220, 235),
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
                                            Center(
                                              child: Text(
                                                'Items',
                                                style: TextStyle(
                                                    // fontSize: isTablet ? 40 : 20.0,
                                                    ),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                'Qty',
                                                style: TextStyle(
                                                    // fontSize: isTablet ? 40 : 20.0,
                                                    ),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                'Amount',
                                                style: TextStyle(
                                                    // fontSize: isTablet ? 40 : 20.0,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: placeOrderProvider
                                        .orderSummaryList!.length,
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
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 30,
                                                            height: 30,
                                                            child: Image.network(
                                                                'https://souq-jumla.noviindusdemosites.in/${placeOrderProvider.orderSummaryList![index].image}'),
                                                          ),
                                                          Flexible(
                                                            child: Text(
                                                              '${placeOrderProvider.orderSummaryList![index].itemEng}',
                                                              style: TextStyle(
                                                                fontSize:
                                                                    isTablet
                                                                        ? 26
                                                                        : 13.0,
                                                              ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ]),
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      placeOrderProvider
                                                                  .orderSummaryList![
                                                                      index]
                                                                  .unit ==
                                                              "kg"
                                                          ? '${placeOrderProvider.orderSummaryList![index].unit} Kg'
                                                          : "${placeOrderProvider.orderSummaryList![index].quantity}",
                                                      style: TextStyle(
                                                          fontSize: isTablet
                                                              ? 26
                                                              : 13.0),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                      8.0,
                                                    ),
                                                    child: Text(
                                                      'AED ${placeOrderProvider.orderSummaryList![index].amount}',
                                                      style: TextStyle(
                                                        fontSize: isTablet
                                                            ? 26
                                                            : 13.0,
                                                      ),
                                                    ),
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
                                    color:
                                        const Color.fromARGB(85, 17, 220, 235),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Total Expenses"),
                                              Text(
                                                  "AED ${placeOrderProvider.totalExpanses}"),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Total Discount"),
                                              // SizedBox(width: 2),
                                              Text(
                                                  "AED ${placeOrderProvider.totalDiscount}"),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 13,
                                  ),

                                  ///grand total
                                  Divider(),

                                  SizedBox(
                                    height: 13,
                                  ),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Grand Total",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "AED ${placeOrderProvider.grandTotal}",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
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
          );
        },
      ),
    );
  }
}

class myorderdetailswidget extends StatelessWidget {
  final String? title;
  final String? subTitle;
  // final bool? isDeleavered;
  final bool isTablet;
  final bool? newOrder;
  final bool? isorderCanceled;
  final bool? isDelevered;
  const myorderdetailswidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.isTablet,
    this.newOrder,
    this.isorderCanceled,
    this.isDelevered,
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
              newOrder == true
                  ? Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 14, 26, 187),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 2,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Center(
                              child: Text(
                                "New Order",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : isorderCanceled == true
                      ? Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 10, 10),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  radius: 2,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Center(
                                  child: Text(
                                    "Order Cancelled",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      : SizedBox(),
            ],
          ),
          Text(
            "$subTitle",
            style: TextStyle(
              color: Colors.black,
              fontSize: isTablet ? 26 : 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      );
    });
  }
}
