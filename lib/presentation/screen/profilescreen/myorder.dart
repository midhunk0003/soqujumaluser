import 'package:customersouqjumla/presentation/provider/placeorder/placeorderprovider.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/widgets/subheadingwidgets.dart';
import 'package:customersouqjumla/presentation/widgets/appbarreusable.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Myorder extends StatefulWidget {
  const Myorder({Key? key}) : super(key: key);

  @override
  State<Myorder> createState() => _MyorderState();
}

class _MyorderState extends State<Myorder> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Placeorderprovider>(context, listen: false).getMyOrders();
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
          // final leng = placeOrderProvider.myOrder?.length ?? 0;
          // print("length is");
          if (placeOrderProvider.isGetLoading == true) {
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
          } else if (placeOrderProvider.myOrder == null) {
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
                            // height: 268,F
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 245, 245, 245),
                              // color: Colors.yellow,
                              border: Border.all(width: 1, color: Colors.green),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 0, 0, 0)
                                      .withOpacity(0.5), // Shadow color
                                  spreadRadius:
                                      -3, // How much the shadow spreads
                                  blurRadius: 9, // The blur effect (softness)
                                  offset: Offset(3,
                                      3), // The position of the shadow (x, y)
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
                                                subTitle:
                                                    '${placeOrderProvider.myOrder![index].orderId}',
                                              ),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              myorderdetailswidget(
                                                title: 'Ordered on',
                                                subTitle:
                                                    '${placeOrderProvider.myOrder![index].orderDate}',
                                              ),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              myorderdetailswidget(
                                                title: 'Order Details',
                                                subTitle:
                                                    '${placeOrderProvider.myOrder![index].orderDetails} Item AED ${placeOrderProvider.myOrder![index].orderTotalofferprice}',
                                              )
                                            ],
                                          ),
                                        ),
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
                                                    '${placeOrderProvider.myOrder![index].supermarketEng}',
                                              ),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              myorderdetailswidget(
                                                title: placeOrderProvider
                                                            .myOrder![index]
                                                            .isdelivered ==
                                                        false
                                                    ? ''
                                                    : 'Delivery on',
                                                subTitle: placeOrderProvider
                                                            .myOrder![index]
                                                            .isdelivered ==
                                                        false
                                                    ? ''
                                                    : 'Today at 08:00PM',
                                                newOrder: placeOrderProvider
                                                    .myOrder![index].isneworder,
                                                isDelevered: placeOrderProvider
                                                    .myOrder![index]
                                                    .isdelivered,
                                                isorderCanceled:
                                                    placeOrderProvider
                                                        .myOrder![index]
                                                        .iscancelled,
                                              ),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              myorderdetailswidget(
                                                title: 'Delivery Address',
                                                subTitle:
                                                    '${placeOrderProvider.myOrder![index].address}',
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
                                                context, '/ordersummary',
                                                arguments: {
                                                  'orderId': placeOrderProvider
                                                      .myOrder![index].orderid
                                                });
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
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                          onTap: () async {
                                            final orderId = placeOrderProvider
                                                .myOrder![index].orderid;
                                            print("${orderId}");
                                            placeOrderProvider.myOrder![index]
                                                        .iscancelled ==
                                                    false
                                                ? await placeOrderProvider
                                                    .cancelOrder(
                                                        orderId.toString(),
                                                        index)
                                                : print(
                                                    "Navigate to complaint");
                                            // placeOrderProvider.getMyOrders();
                                          },
                                          child: Container(
                                            height: 36,
                                            decoration: BoxDecoration(
                                              color: placeOrderProvider
                                                          .myOrder![index]
                                                          .iscancelled ==
                                                      true
                                                  ? Colors.orange
                                                  : Colors.yellow,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  placeOrderProvider
                                                              .myOrder![index]
                                                              .iscancelled ==
                                                          true
                                                      ? Icon(
                                                          Icons.phone,
                                                          color: Colors.white,
                                                        )
                                                      : Icon(
                                                          Icons.close,
                                                        ),
                                                  placeOrderProvider
                                                              .myOrder![index]
                                                              .iscancelled ==
                                                          true
                                                      ? Text(
                                                          "Complaints",
                                                          style: TextStyle(
                                                              color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  255),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        )
                                                      : Text(
                                                          placeOrderProvider
                                                                      .isGetLoading ==
                                                                  true
                                                              ? "Loading..."
                                                              : "Cancle Order",
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
                        itemCount: placeOrderProvider.myOrder!.isEmpty
                            ? 0
                            : placeOrderProvider.myOrder!.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 25,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 25,
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
  final bool? newOrder;
  final bool? isorderCanceled;
  final bool? isDelevered;
  const myorderdetailswidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.newOrder,
    this.isorderCanceled,
    this.isDelevered,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // newOrder == false && isorderCanceled == false
            Text(
              "$title",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.visible),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
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
            fontSize: 13,
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
