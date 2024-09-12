import 'package:customersouqjumla/presentation/provider/homeprovider/bottomsheet_qty_change_provider.dart';
import 'package:customersouqjumla/presentation/provider/homeprovider/category_by_product_provider.dart';
import 'package:customersouqjumla/presentation/provider/homeprovider/category_provider.dart';
import 'package:customersouqjumla/presentation/provider/likedproductprovider/likedproductprovider.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/widgets/ruler.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/widgets/slider.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/widgets/subheadingwidgets.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/widgets/tracker_ruler_widget_items.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/widgets/trackers_ruler_widget.dart';
import 'package:customersouqjumla/presentation/widgets/appbarreusable.dart';
import 'package:customersouqjumla/presentation/widgets/bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class Homesubcategory extends StatelessWidget {
  final int? storeId;
  final int? categoryId;
  Homesubcategory({Key? key, required this.storeId, required this.categoryId})
      : super(key: key);

  num _selectedValue = 14.50;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CategoryByProductProvider>(context, listen: false)
          .getcategoryByproduct(
              storeId.toString(), categoryId.toString(), true);
    });
    return Consumer2<CategoryByProductProvider, Likedproductprovider>(
      builder:
          (context, categoryByproductProvider, likedProductProvider, child) {
        final categoryByProductdatalist =
            categoryByproductProvider.categoryByProductList;
        print(
            '4564564564564564564565 :${likedProductProvider.likedProductList}');
        if (categoryByproductProvider.isLoading == true) {
          return Center(
            child: Center(
              child: Lottie.asset(
                'assets/json/loadingcircle.json',
                width: 200,
                height: 150,
                fit: BoxFit.fill,
              ),
            ),
          );
        } else if (categoryByproductProvider.errorMessage != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text("${categoryByproductProvider.errorMessage}")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    categoryByproductProvider.getcategoryByproduct(
                        storeId.toString(), categoryId.toString(), true);
                  },
                  child: Text("Retry"),
                )
              ],
            ),
          );
        } else if (categoryByProductdatalist == null ||
            categoryByProductdatalist.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text("Product is empty")),
                SizedBox(
                  height: 10,
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     categoryByproductProvider.getcategoryByproduct(
                //         storeId.toString(), categoryId.toString());
                //   },
                //   child: Text("Retry"),
                // )
              ],
            ),
          );
        }
        return Scaffold(
          appBar: const CustomAppBar(
            automaticallyImplyLeading1: true,
            title: Image(
              width: 92,
              image: AssetImage(
                'assets/images/logo.png',
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: LayoutBuilder(
              builder: (context, constraints) {
                bool isTablet = constraints.maxWidth > 600;
                // double width = constraints.maxWidth * 0.8;
                // double height = constraints.maxHeight * 0.2;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    subheadingwidget(
                      isTablet: isTablet,
                      heading: "Fruits",
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    //search bar and button
                    Padding(
                      padding: isTablet
                          ? const EdgeInsets.only(left: 50, right: 50)
                          : const EdgeInsets.only(left: 25, right: 25),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              width: isTablet ? 100 : 242,
                              height: isTablet ? 50 : 40,
                              decoration: BoxDecoration(
                                // color: Colors.amber,
                                border: Border.all(width: .3),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ), // Add padding to avoid text being too close to the edges
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      prefixIcon: Image.asset(
                                        'assets/images/circum_search.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                      border: InputBorder
                                          .none, // Removes the default underline border
                                      hintText: 'search for a product',
                                      hintStyle: TextStyle(
                                        color: Colors.grey[600],
                                      ), // Hint text style
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: isTablet ? 100 : 84,
                            height: isTablet ? 50 : 40,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 18, 126, 4),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                "Search",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),

                    ///grid view
                    categoryByProductdatalist.isNotEmpty
                        ? Padding(
                            padding: isTablet
                                ? const EdgeInsets.only(left: 50, right: 50)
                                : const EdgeInsets.only(left: 25, right: 25),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: categoryByProductdatalist.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: isTablet ? 3 : 2,
                                crossAxisSpacing: isTablet ? 20 : 20.0,
                                mainAxisSpacing: isTablet ? 20 : 20.0,
                                childAspectRatio: 1.0,
                                mainAxisExtent: isTablet ? 300 : 200,
                              ),
                              itemBuilder: (context, index) {
                                final dataListofcategoryByproduct =
                                    categoryByProductdatalist[index];

                                // final categoryProductId =
                                //     categoryByProductdatalist[index].id;
                                // final addedliked = likedProductProvider
                                //     .likedProductList![index].id;
                                // print(
                                //     'added printed 7777777777777777777 :${addedliked}');
                                // print(
                                //     'added printed 000000000000000 :${categoryProductId}');
                                return Stack(
                                  // alignment: AlignmentDirectional.center,
                                  children: [
                                    Container(
                                      // width: isTablet ? 320 : 160,
                                      // height: isTablet ? 440 : 220,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.8, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(20),
                                        // color: Colors.amber,
                                      ),
                                      child: Padding(
                                        padding: isTablet
                                            ? const EdgeInsets.only(
                                                left: 30, right: 30)
                                            : const EdgeInsets.only(
                                                left: 15, right: 15),
                                        child: Column(
                                          // crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    width: isTablet ? 200 : 170,
                                                    height:
                                                        isTablet ? 120 : 100,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      child: Image.network(
                                                        'https://souq-jumla.noviindusdemosites.in/${dataListofcategoryByproduct.image}',
                                                        fit: BoxFit.cover,
                                                        loadingBuilder: (context,
                                                            child,
                                                            loadingProgress) {
                                                          if (loadingProgress ==
                                                              null) {
                                                            return child; // Image is fully loaded
                                                          } else {
                                                            return Shimmer
                                                                .fromColors(
                                                              baseColor: Colors
                                                                  .grey[300]!,
                                                              highlightColor:
                                                                  Colors.grey[
                                                                      100]!,
                                                              child: Container(
                                                                height: isTablet
                                                                    ? 250
                                                                    : 125,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                  color: Colors
                                                                          .grey[
                                                                      300],
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              // color: Colors.amber,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${dataListofcategoryByproduct.engTitle}',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize:
                                                          isTablet ? 24 : 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: isTablet ? 10 : 5,
                                                  ),
                                                  dataListofcategoryByproduct
                                                          .unit!.isEmpty
                                                      ? SizedBox()
                                                      : Text(
                                                          'By weight AED ${dataListofcategoryByproduct.price}/ KG',
                                                          style: TextStyle(
                                                            color: const Color
                                                                .fromARGB(
                                                              255,
                                                              146,
                                                              145,
                                                              145,
                                                            ),
                                                            fontSize: isTablet
                                                                ? 22
                                                                : 11,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                ],
                                              ),
                                            ),

                                            SizedBox(
                                              height: isTablet ? 10 : 5,
                                            ),
                                            //last section increase kg
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'AED${dataListofcategoryByproduct.price}',
                                                  style: TextStyle(
                                                    color: const Color.fromARGB(
                                                      255,
                                                      0,
                                                      0,
                                                      0,
                                                    ),
                                                    fontSize:
                                                        isTablet ? 20 : 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                // SizedBox(
                                                //   width: 10,
                                                // ),

                                                Expanded(
                                                  child: IconButton(
                                                    onPressed: () {
                                                      final productId =
                                                          dataListofcategoryByproduct
                                                              .id;
                                                      final productImage =
                                                          dataListofcategoryByproduct
                                                              .image;
                                                      final productName =
                                                          dataListofcategoryByproduct
                                                              .engTitle;
                                                      final productPrice =
                                                          dataListofcategoryByproduct
                                                              .price;
                                                      final productUnit =
                                                          dataListofcategoryByproduct
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
                                                    icon: Icon(
                                                      Icons.add_box_rounded,
                                                      size: 34,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: isTablet ? 20 : 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: isTablet ? 10 : 10,
                                      // left: isTablet ? 170 : 120,
                                      top: isTablet ? 9 : 9,

                                      child: SizedBox(
                                        height: isTablet ? 44 : 33,
                                        width: isTablet ? 48 : 30,
                                        child: GestureDetector(
                                          onTap: () async {
                                            final productid =
                                                dataListofcategoryByproduct.id;
                                            bool? isLiked =
                                                dataListofcategoryByproduct
                                                    .islike;
                                            likedProductProvider.isLiked ==
                                                    false
                                                ? await likedProductProvider
                                                    .postTolikedProduct(
                                                        storeId.toString(),
                                                        productid.toString(),
                                                        true,
                                                        context,
                                                        dataListofcategoryByproduct)
                                                : await likedProductProvider
                                                    .postTolikedProduct(
                                                        storeId.toString(),
                                                        productid.toString(),
                                                        false,
                                                        context,
                                                        dataListofcategoryByproduct);

                                            await categoryByproductProvider
                                                .getcategoryByproduct(
                                                    storeId.toString(),
                                                    categoryId.toString(),
                                                    false);
                                            likedProductProvider
                                                .getLikedProductList(
                                              storeId.toString(),
                                            );
                                          },
                                          child: Image(
                                            // color: Colors.grey,
                                            image: dataListofcategoryByproduct
                                                        .islike ==
                                                    true
                                                ? AssetImage(
                                                    'assets/images/likedimage.png',
                                                  )
                                                : AssetImage(
                                                    'assets/images/iconimage/heartblack.png',
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          )
                        : Container(
                            height: 600,
                            // color: Colors.amber,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text("Empty Product"),
                                ),
                              ],
                            ),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
