import 'package:carousel_slider/carousel_slider.dart';
import 'package:customersouqjumla/presentation/provider/homeprovider/category_provider.dart';
import 'package:customersouqjumla/presentation/provider/homeprovider/homeccarouselprovider.dart';
import 'package:customersouqjumla/presentation/widgets/appbarreusable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class Homescreen extends StatelessWidget {
  final int? storeId;
  Homescreen({Key? key, required this.storeId}) : super(key: key);

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CategoryProvider>(context, listen: false)
          .getCategory(storeId.toString());
      Provider.of<CarouselProvider>(context, listen: false).getImagebanner();
    });
    return Consumer2<CarouselProvider, CategoryProvider>(
      builder: (context, carouserpro, categoryProvider, child) {
        if (categoryProvider.isLoading == true) {
          return Center(
            child: Lottie.asset(
              'assets/json/loadingcircle.json',
              width: 200,
              height: 150,
              fit: BoxFit.fill,
            ),
          );
        } else if (categoryProvider.errorMessage != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text("${categoryProvider.errorMessage}")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    categoryProvider.getCategory(storeId.toString());
                  },
                  child: Text("Retry"),
                )
              ],
            ),
          );
        }
        return Scaffold(
          backgroundColor: Colors.white,
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
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: isTablet
                          ? const EdgeInsets.only(left: 50, right: 50)
                          : const EdgeInsets.only(left: 25, right: 25),
                      child: Text(
                        "Find Everything You Need,\nRight at Your Doorstep",
                        style: TextStyle(
                          fontSize: isTablet ? 28 : 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
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
                                        vertical: 11.0,
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
                    carouserpro.bannercarouseldatas.isNotEmpty
                        ? Padding(
                            padding: isTablet
                                ? const EdgeInsets.only(left: 50, right: 50)
                                : const EdgeInsets.only(left: 25, right: 25),
                            child: Column(
                              children: [
                                CarouselSlider.builder(
                                  itemCount:
                                      carouserpro.bannercarouseldatas.length,
                                  itemBuilder: (context, index, realIndex) {
                                    final item =
                                        carouserpro.bannercarouseldatas[index];
                                    return Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            scale: isTablet ? 18 : 22,
                                            alignment: Alignment.bottomRight,
                                            image: NetworkImage(
                                              'https://souq-jumla.noviindusdemosites.in/${item.image}',
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          color: const Color.fromARGB(
                                              255, 151, 216, 253),
                                        ),
                                        child: Padding(
                                          padding: isTablet
                                              ? const EdgeInsets.only(
                                                  left: 30, top: 40)
                                              : const EdgeInsets.only(
                                                  left: 18, top: 33),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: isTablet ? 12 : 6,
                                              ),
                                              SizedBox(
                                                height: isTablet ? 20 : 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  options: CarouselOptions(
                                    height: isTablet ? 250 : 200,
                                    autoPlay: true,
                                    enlargeCenterPage: true,
                                    viewportFraction: 1.0,
                                    onPageChanged: (index, reason) {
                                      print("on page change index : $index");
                                      // carouserpro.currentIndex;
                                      carouserpro.nextPage();
                                      // carouserpro.currentIndex = index;
                                      carouserpro.notifyListeners();
                                    },
                                    initialPage: carouserpro.currentIndex,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),

                    const SizedBox(
                      height: 15,
                    ),

                    //slide indicators
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        carouserpro.bannercarouseldatas.length,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Consumer<CarouselProvider>(
                              builder: (context, value, child) {
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  height: 4,
                                  width: index == carouserpro.currentIndex
                                      ? 31
                                      : 16,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: index == carouserpro.currentIndex
                                        ? Colors.green
                                        : Colors.grey,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),

                    //category

                    Padding(
                      padding: isTablet
                          ? const EdgeInsets.only(
                              left: 50,
                              right: 50,
                            )
                          : const EdgeInsets.only(
                              left: 25,
                              right: 25,
                            ),
                      child: Text(
                        "Category",
                        style: TextStyle(
                          fontSize: isTablet ? 22 : 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),

                    Consumer<CategoryProvider>(
                      builder: (context, categoryProvider, child) {
                        final length = categoryProvider.categoryList!.length;

                        print("length is $length");
                        return Padding(
                          padding: isTablet
                              ? const EdgeInsets.only(left: 50, right: 50)
                              : const EdgeInsets.only(
                                  left: 25,
                                  right: 25,
                                ),
                          child: categoryProvider.categoryList!.isNotEmpty
                              ? GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, // Number of columns
                                    crossAxisSpacing: isTablet ? 40 : 20.0,
                                    mainAxisSpacing: isTablet ? 40 : 20.0,
                                    childAspectRatio: 1.0,
                                    mainAxisExtent: isTablet
                                        ? 400
                                        : 200, // Aspect ratio of the grid items
                                  ),
                                  itemCount: length,
                                  itemBuilder: (context, index) {
                                    final datalist =
                                        categoryProvider.categoryList!;
                                    return InkWell(
                                      onTap: () {
                                        print("store id : ${storeId}");
                                        print(
                                            "category Id : ${datalist[index].id}");
                                        final categoryId = datalist[index].id;
                                        Navigator.pushNamed(
                                          context,
                                          '/Homesubcategory',
                                          arguments: {
                                            'storeid': storeId,
                                            'categotyid': categoryId
                                          },
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.blue,
                                              // color: const Color.fromARGB(
                                              //         255, 0, 0, 0)
                                              // .withOpacity(0.5), // Shadow color
                                              spreadRadius:
                                                  0.5, // Spread radius
                                              blurRadius: 5, // Blur radius
                                              offset: Offset(0,
                                                  3), // Shadow position (x, y)
                                            ),
                                          ],
                                          border: Border.all(
                                              width: 0.8, color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                  height: isTablet ? 250 : 125,
                                                  // width: isTablet ? 250 : 125,
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: Image.network(
                                                      "https://souq-jumla.noviindusdemosites.in/${datalist[index].image}",
                                                      fit: BoxFit.cover,
                                                      loadingBuilder: (context,
                                                          child,
                                                          loadingProgress) {
                                                        if (loadingProgress ==
                                                            null) {
                                                          return child; // Image is fully loaded
                                                        } else {
                                                          // Show progress indicator while loading
                                                          return Shimmer
                                                              .fromColors(
                                                            baseColor: Colors
                                                                .grey[300]!,
                                                            highlightColor:
                                                                Colors
                                                                    .grey[100]!,
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
                                                                    .grey[300],
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
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: isTablet ? 60 : 30,
                                                width: isTablet ? 250 : 125,
                                                decoration: const BoxDecoration(
                                                  color: Colors.transparent,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        "${datalist[index].engTitle}",
                                                        style: TextStyle(
                                                          // fontSize: isTablet ? 28 : 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Icon(
                                                        Icons.arrow_forward_ios,
                                                        size:
                                                            isTablet ? 30 : 20,
                                                        color:
                                                            Colors.green[300],
                                                      ),
                                                    ),
                                                  ],
                                                ),
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
                                    children: [
                                      Text("No Category Found"),
                                      Lottie.asset(
                                        'assets/json/empty.json',
                                        width: 200,
                                        height: 150,
                                        fit: BoxFit.fill,
                                      ),
                                    ],
                                  ),
                                ),
                        );
                      },
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
