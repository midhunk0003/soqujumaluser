import 'package:customersouqjumla/presentation/provider/cartprovider/cart_provider.dart';
import 'package:customersouqjumla/presentation/provider/homeprovider/bottomsheet_qty_change_provider.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/widgets/trackers_ruler_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

Future<void> showscrollingBottomsheet(
  BuildContext context,
  index,
  storeId,
  productId,
  productImage,
  productName,
  productPrice,
  productUnit,
) async {
  print('index in bottom sheet :  $index');
  print('storeId in bottom sheet :  $storeId');
  print('productId in bottom sheet :  $productId');
  print('productImage in bottom sheet :  $productImage');
  print('productName in bottom sheet :  $productName');
  print('productPrice in bottom sheet :  $productPrice');
  print('productUnit in bottom sheet :  $productUnit');
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Consumer<BottomSheetQtyProvider>(
          builder: (ctx, value, child) {
            return LayoutBuilder(
              builder: (ctx, constraints) {
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
                              Image.network(
                                'https://souq-jumla.noviindusdemosites.in/${productImage}',
                              ),
                              SizedBox(
                                width: 11,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ' $productName',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: isTablet ? 24 : 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: isTablet ? 10 : 5,
                                  ),
                                  productUnit == 'kg'
                                      ? Text(
                                          'By weight AED ${productPrice}/ KG}',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                              255,
                                              146,
                                              145,
                                              145,
                                            ),
                                            fontSize: isTablet ? 22 : 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : Text(
                                          'AED ${productPrice}',
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
                          builder: (ctx, calculatedvalueprovider, child) {
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
                          builder: (ctx, bottomsheetqtyprovider, _) {
                            return TrackersRulerWidget(
                              max: 100,
                              min: 1,
                              unitsMeasurement: 'G',
                              selectValue: bottomsheetqtyprovider.selectedValue,
                              onChanged: (newValuekg) {
                                // setState(() {
                                // _selectedValue =
                                //     index;
                                print("newvalue1111 :  ${newValuekg}");
                                bottomsheetqtyprovider
                                    .updateValue(newValuekg.round());
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
                                builder: (ctx, changedValueprovider, child) {
                                  return Text(
                                    "${changedValueprovider.selectedValue.toStringAsFixed(0)}",
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
                        Consumer2<BottomSheetQtyProvider, CartProvider>(
                          builder: (ctx, savetoCartbottomsheet, cartProvider,
                              child) {
                            return InkWell(
                              onTap: () {
                                print("save to cart");
                                final num calculatedquantity =
                                    savetoCartbottomsheet.calculatedAmount
                                        .toDouble();
                                print("save to cart : $calculatedquantity");
                                final num selectedkg = savetoCartbottomsheet
                                    .selectedValue
                                    .toDouble();
                                savetoCartbottomsheet.addToCart(
                                    calculatedquantity, selectedkg);

                                cartProvider.addToCart(
                                  storeId,
                                  productId,
                                  selectedkg.toInt(),
                                  context,
                                );
                                if (cartProvider.isLoading == true) {
                                  print("loading");
                                  Navigator.pop(context);
                                } else {
                                  Navigator.pop(context);
                                }
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
        ),
      );
    },
  );
}
