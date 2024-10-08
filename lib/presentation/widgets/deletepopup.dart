import 'package:customersouqjumla/presentation/provider/cartprovider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void deletepopUp(
    BuildContext context,
    index,
    storeId,
    productId,
    productImage,
    productName,
    productPrice,
    productUnit,
    messagefromscreen,
    quantity,
    categoryId) {
  print('index in bottom sheet :  $index');
  print('storeId in bottom sheet :  $storeId');
  print('productId in bottom sheet :  $productId');
  print('productImage in bottom sheet :  $productImage');
  print('productName in bottom sheet :  $productName');
  print('productPrice in bottom sheet :  $productPrice');
  print('productUnit in bottom sheet :  $productUnit');
  print('messagefromscreen in bottom sheet :  $messagefromscreen');
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Container(
          // color: Colors.amber,
          height: 300,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://souq-jumla.noviindusdemosites.in/${productImage}"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "$productName",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  productUnit == "kg"
                      ? Text(
                          "kg ${productUnit}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : SizedBox(),
                  Text(
                    "AED ${productPrice} * ${quantity}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Are You Sure want to delete from cart...",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                    ),
                  ),
                  Consumer<CartProvider>(
                    builder: (context, cartProviderdelete, child) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                        child: IconButton(
                          onPressed: () {
                            cartProviderdelete.deleteCartItem(
                                categoryId.toString(),
                                context,
                                storeId.toString(),
                                "item delete successfully");
                            print(index);
                          },
                          icon: cartProviderdelete.deleteLoading == false
                              ? Icon(
                                  Icons.delete,
                                  color: const Color.fromARGB(255, 99, 94, 94),
                                )
                              : CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
