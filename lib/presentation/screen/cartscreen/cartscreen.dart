import 'package:customersouqjumla/presentation/provider/cartprovider/cart_provider.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/widgets/subheadingwidgets.dart';
import 'package:customersouqjumla/presentation/widgets/appbarreusable.dart';
import 'package:customersouqjumla/presentation/widgets/bottomsheet.dart';
import 'package:customersouqjumla/presentation/widgets/deletepopup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Cartscreen extends StatefulWidget {
  final int? storeId;
  const Cartscreen({Key? key, required this.storeId}) : super(key: key);

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
  }

  void _toggleContainer() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CartProvider>(context, listen: false)
          .getCartprov(widget.storeId.toString());
    });
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
      body: Container(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600;
            return Consumer<CartProvider>(
                builder: (context, listOfCartProvider, child) {
              return listOfCartProvider.cartList!.isNotEmpty
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            height: 33,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                // color: Colors.amber,
                                ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                subheadingwidget(
                                    heading: "Cart", isTablet: isTablet),
                                IconButton(
                                  padding: isTablet
                                      ? EdgeInsets.only(right: 50)
                                      : EdgeInsets.only(right: 30),
                                  onPressed: () {
                                    _toggleContainer();
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),

                          ListView.separated(
                            itemCount: listOfCartProvider.cartList!.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final cartListdata =
                                  listOfCartProvider.cartList ?? [];
                              return Padding(
                                padding: isTablet
                                    ? const EdgeInsets.only(left: 50, right: 50)
                                    : const EdgeInsets.only(
                                        left: 25, right: 25),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: isTablet ? 160 : 80,
                                      decoration: BoxDecoration(
                                          // color: Colors.amber,
                                          ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          //img and text
                                          Flexible(
                                            child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 700),
                                              curve: Curves.easeInOut,
                                              margin: EdgeInsets.only(
                                                  left: _isExpanded ? 15 : 0),
                                              width: isTablet ? 500 : 200,
                                              // color: Colors.amber,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10),
                                                        width: isTablet
                                                            ? 215
                                                            : 115,
                                                        decoration:
                                                            BoxDecoration(
                                                          // color: const Color.fromARGB(
                                                          //     255, 7, 209, 98),
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(
                                                              'https://souq-jumla.noviindusdemosites.in/${cartListdata[index].image}',
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),

                                                      // kg
                                                      cartListdata[index]
                                                                  .unit ==
                                                              "kg"
                                                          ? Positioned(
                                                              left: isTablet
                                                                  ? 140
                                                                  : 82,
                                                              bottom: isTablet
                                                                  ? 60
                                                                  : 38,
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(1),
                                                                height: isTablet
                                                                    ? 80
                                                                    : 41,
                                                                width: isTablet
                                                                    ? 80
                                                                    : 41,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: const Color
                                                                      .fromARGB(
                                                                      199,
                                                                      240,
                                                                      238,
                                                                      238),
                                                                  borderRadius: isTablet
                                                                      ? BorderRadius
                                                                          .circular(
                                                                              12)
                                                                      : BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  border: Border.all(
                                                                      width: .6,
                                                                      color: Colors
                                                                          .grey),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.5), // Shadow color
                                                                      blurRadius:
                                                                          6, // Blur radius
                                                                      spreadRadius:
                                                                          1, // Spread radius
                                                                      offset:
                                                                          Offset(
                                                                        1,
                                                                        4,
                                                                      ), // Offset in X and Y directions
                                                                    ),
                                                                  ],
                                                                ),
                                                                child: Column(
                                                                  // mainAxisAlignment:
                                                                  //     MainAxisAlignment
                                                                  //         .center,
                                                                  children: [
                                                                    Text(
                                                                      "3.5",
                                                                      style: TextStyle(
                                                                          fontSize: isTablet
                                                                              ? 28
                                                                              : 14,
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        "Kg",
                                                                        style: TextStyle(
                                                                            fontSize: isTablet
                                                                                ? 28
                                                                                : 12,
                                                                            fontWeight:
                                                                                FontWeight.w400),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          : SizedBox(),
                                                    ],
                                                  ),
                                                  // Container(
                                                  //   margin: EdgeInsets.only(left: 10),
                                                  //   width: 100,
                                                  //   height: 100,
                                                  //   color: Colors.green,
                                                  // ),
                                                  Flexible(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            "${cartListdata[index].engTitle}",
                                                            style: TextStyle(
                                                              fontSize: isTablet
                                                                  ? 28
                                                                  : 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                            maxLines: 1,
                                                            overflow: TextOverflow
                                                                .ellipsis, // Adds "..." when text overflows
                                                          ),
                                                        ),
                                                        Text(
                                                          "AED ${cartListdata[index].price} * ${cartListdata[index].cartquantity}",
                                                          style: TextStyle(
                                                            fontSize: isTablet
                                                                ? 22
                                                                : 11,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),

                                          //edit text
                                          TextButton(
                                            onPressed: () {
                                              showscrollingBottomsheet(
                                                context,
                                                index,
                                                widget.storeId,
                                                cartListdata[index].id,
                                                cartListdata[index].image,
                                                cartListdata[index].engTitle,
                                                cartListdata[index].price,
                                                cartListdata[index].unit,
                                                "Successfully updated",
                                              );
                                            },
                                            child: Text(
                                              "EDIT",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.green,
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: Colors.green,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    //delete button hide and show
                                    Positioned(
                                      top: isTablet ? 65 : 25,
                                      left: 0,
                                      // right: 0,
                                      child: AnimatedOpacity(
                                        opacity: _isExpanded ? 1.0 : 0.0,
                                        duration: Duration(milliseconds: 800),
                                        child: InkWell(
                                          onTap: () {
                                            print(index);
                                            deletepopUp(
                                              context,
                                              index,
                                              widget.storeId,
                                              cartListdata[index].id,
                                              cartListdata[index].image,
                                              cartListdata[index].engTitle,
                                              cartListdata[index].price,
                                              cartListdata[index].unit,
                                              "Successfully updated",
                                              cartListdata[index].cartquantity,
                                              cartListdata[index].cartid,
                                            );
                                          },
                                          child: Container(
                                            height: 24,
                                            width: 24,
                                            decoration: BoxDecoration(
                                              // color: Colors.red,
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/iconimage/deletehideandshow.png'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                thickness: 2,
                              );
                            },
                          ),
                          SizedBox(
                            height: isTablet ? 40 : 20,
                          ),
                          Container(
                            height: isTablet ? 540 : 270,
                            width: isTablet ? 680 : 340,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 241, 241, 240),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(0.5), // Shadow color
                                  blurRadius: 8, // Blur radius
                                  spreadRadius: 2, // Spread radius
                                  offset: Offset(
                                      1, 4), // Offset in X and Y directions
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25, right: 25, top: 30),
                                  child: Column(
                                    children: [
                                      totalamountbill(
                                        totalNumberofItems:
                                            "Total Number Of Items",
                                        nos:
                                            "${listOfCartProvider.cartList!.length} Nos",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      SizedBox(
                                        height: isTablet ? 50 : 25,
                                      ),
                                      totalamountbill(
                                        totalNumberofItems: "Total expenses",
                                        nos:
                                            "AED ${listOfCartProvider.totalExpenses}",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      SizedBox(
                                        height: isTablet ? 50 : 25,
                                      ),
                                      totalamountbill(
                                        totalNumberofItems: "Total discounts",
                                        nos:
                                            "AED ${listOfCartProvider.totalDiscount}",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25, right: 25),
                                  child: Column(
                                    children: [
                                      totalamountbill(
                                        totalNumberofItems: "Grang Total",
                                        nos:
                                            "AED ${listOfCartProvider.totalDiscount}",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        '.....Payment to be made at the time of delivery.....',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: isTablet ? 100 : 50,
                          ),

                          //button
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/AddressCart',
                                arguments: {'storeId': widget.storeId},
                              );
                            },
                            child: Container(
                              height: isTablet ? 100 : 50,
                              width: isTablet ? 680 : 340,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "Continue",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: isTablet ? 100 : 50,
                          ),
                        ],
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('CART IS EMPTY ADD SOME ITEMS'),
                        Center(
                          child: Lottie.asset(
                            'assets/json/empty.json',
                            width: 300,
                            height: 300,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    );
            });
          },
        ),
      ),
    );
  }
}

class totalamountbill extends StatelessWidget {
  final String? totalNumberofItems;
  final String? nos;
  final double? fontSize;
  final FontWeight? fontWeight;

  const totalamountbill({
    super.key,
    this.totalNumberofItems,
    this.nos,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$totalNumberofItems",
              style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
            ),
            Text(
              "$nos",
              style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
            )
          ],
        ),
      ],
    );
  }
}
