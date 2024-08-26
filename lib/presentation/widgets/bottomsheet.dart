import 'package:customersouqjumla/presentation/provider/homeprovider/bottomsheet_qty_change_provider.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/widgets/trackers_ruler_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

Future<void> showscrollingBottomsheet(BuildContext context, index) async {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Consumer<BottomSheetQtyProvider>(
        builder: (context, value, child) {
          return LayoutBuilder(
            builder: (context, constraints) {
              bool isTablet = constraints.maxWidth > 600;
              return Container(
                height: 800,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  // color: Colors.amber,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 22,
                      ),
                      Container(
                        width: 90,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),

                      //image and text
                      Container(
                        width: isTablet ? 600 : 308,
                        height: isTablet ? 180 : 90,
                        decoration: BoxDecoration(
                            // color: Colors.amber,
                            ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/vegitables.png',
                            ),
                            SizedBox(
                              width: 11,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Apple $index',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: isTablet ? 24 : 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: isTablet ? 10 : 5,
                                ),
                                Text(
                                  'By weight AED 14.50/ KG}',
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      146,
                                      145,
                                      145,
                                    ),
                                    fontSize: isTablet ? 22 : 11,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 34,
                      ),
                      Consumer<BottomSheetQtyProvider>(
                        builder: (context, calculatedvalueprovider, child) {
                          return Container(
                            height: 42,
                            width: 160,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "AED ${calculatedvalueprovider.calculatedAmount.toStringAsFixed(1)}",
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      Consumer<BottomSheetQtyProvider>(
                        builder: (context, bottomsheetqtyprovider, _) {
                          return TrackersRulerWidget(
                            max: 100,
                            min: 0,
                            unitsMeasurement: 'G',
                            selectValue: bottomsheetqtyprovider.selectedValue,
                            onChanged: (newValue) {
                              // setState(() {
                              // _selectedValue =
                              //     index;
                              bottomsheetqtyprovider.updateValue(newValue);
                              // print(
                              //     ' newvalue1111 :  ${_selectedValue}');
                              // });
                            },
                          );
                        },
                      ),

                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 24,
                        width: 100,
                        // color:
                        //     Colors.amber,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Qty:',
                              style: TextStyle(fontSize: 20),
                            ),
                            Consumer<BottomSheetQtyProvider>(
                              builder: (context, changedValueprovider, child) {
                                return Text(
                                  "${changedValueprovider.selectedValue.toStringAsFixed(1)}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      //button
                      Consumer<BottomSheetQtyProvider>(
                        builder: (context, savetoCart, child) {
                          return InkWell(
                            onTap: () {
                              print("save to cart");
                              final num calculatedquantity =
                                  savetoCart.calculatedAmount.toDouble();
                              print("save to cart : $calculatedquantity");
                              final num selectedkg =
                                  savetoCart.selectedValue.toDouble();
                              savetoCart.addToCart(
                                  calculatedquantity, selectedkg);
                            },
                            child: Container(
                              height: 50,
                              width: 310,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "Add To Bag",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    },
  );
}
