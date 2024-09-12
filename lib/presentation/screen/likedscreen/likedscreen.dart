import 'package:customersouqjumla/presentation/provider/likedproductprovider/likedproductprovider.dart';
import 'package:customersouqjumla/presentation/provider/selectstoreprovider/selectstoreprovider.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/widgets/subheadingwidgets.dart';
import 'package:customersouqjumla/presentation/widgets/appbarreusable.dart';
import 'package:customersouqjumla/presentation/widgets/bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Likedscreen extends StatelessWidget {
  final int? storeId;
  const Likedscreen({Key? key, required this.storeId}) : super(key: key);

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
        body: Consumer2<Likedproductprovider, Selectstoreprovider>(
          builder: (context, likedProductProvider, selectStoreProvider, child) {
            final likedProductList =
                likedProductProvider.likedProductList ?? [];

            if (likedProductProvider.isLoading == true) {
              return Center(
                child: Lottie.asset(
                  'assets/json/loadingcircle.json',
                  width: 200,
                  height: 150,
                  fit: BoxFit.fill,
                ),
              );
            }
            return likedProductList.isNotEmpty
                ? LayoutBuilder(
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
                                    : const EdgeInsets.only(
                                        left: 25,
                                        right: 25,
                                      ),
                                child: ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: likedProductProvider
                                      .likedProductList!.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: isTablet ? 160 : 90,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.8, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                width: isTablet ? 200 : 100,
                                                decoration: BoxDecoration(
                                                  // color: Colors.amber,
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        'https://souq-jumla.noviindusdemosites.in/${likedProductProvider.likedProductList![index].image}'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "${likedProductProvider.likedProductList![index].engTitle}",
                                                      style: TextStyle(
                                                        fontSize:
                                                            isTablet ? 28 : 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    likedProductProvider
                                                            .likedProductList![
                                                                index]
                                                            .unit!
                                                            .isNotEmpty
                                                        ? Text(
                                                            "By weight AED ${likedProductProvider.likedProductList![index].price}/ KG",
                                                            style: TextStyle(
                                                              fontSize: isTablet
                                                                  ? 22
                                                                  : 11,
                                                            ),
                                                          )
                                                        : Text(
                                                            "AED ${likedProductProvider.likedProductList![index].price}",
                                                            style: TextStyle(
                                                              fontSize: isTablet
                                                                  ? 22
                                                                  : 11,
                                                            ),
                                                          ),
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  final productId =
                                                      likedProductProvider
                                                          .likedProductList![
                                                              index]
                                                          .id;
                                                  final productImage =
                                                      likedProductProvider
                                                          .likedProductList![
                                                              index]
                                                          .image;
                                                  final productName =
                                                      likedProductProvider
                                                          .likedProductList![
                                                              index]
                                                          .engTitle;
                                                  final productPrice =
                                                      likedProductProvider
                                                          .likedProductList![
                                                              index]
                                                          .price;
                                                  final productUnit =
                                                      likedProductProvider
                                                          .likedProductList![
                                                              index]
                                                          .unit;
                                                  showscrollingBottomsheet(
                                                    context,
                                                    index,
                                                    storeId,
                                                    productId,
                                                    productImage,
                                                    productName,
                                                    productPrice,
                                                    productUnit,
                                                  );
                                                },
                                                child: Container(
                                                  height: isTablet ? 70 : 56,
                                                  width: isTablet ? 70 : 56,
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(
                                                                0.5), // Shadow color
                                                        blurRadius:
                                                            8, // Blur radius
                                                        spreadRadius:
                                                            1, // Spread radius
                                                        offset: Offset(4,
                                                            4), // Offset in X and Y directions
                                                      )
                                                    ],
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Center(
                                                    child: Image.asset(
                                                        'assets/images/iconimage/cartnoblack.png'),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
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
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("No liked product"),
                        SizedBox(
                          height: 20,
                        ),
                        Lottie.asset(
                          'assets/json/empty.json',
                          width: 200,
                          height: 150,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  );
          },
        ));
  }
}
