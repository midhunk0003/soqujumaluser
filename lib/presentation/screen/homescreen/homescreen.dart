import 'package:carousel_slider/carousel_slider.dart';
import 'package:customersouqjumla/presentation/provider/homeprovider/homeccarouselprovider.dart';
import 'package:customersouqjumla/presentation/widgets/appbarreusable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  Homescreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final carouserpro = Provider.of<CarouselProvider>(context);
    print("datasssssss: ${carouserpro.carouseldata}");
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
                                  contentPadding: const EdgeInsets.symmetric(
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

                Padding(
                  padding: isTablet
                      ? const EdgeInsets.only(left: 50, right: 50)
                      : const EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    children: [
                      CarouselSlider.builder(
                        itemCount: carouserpro.carouseldata.length,
                        itemBuilder: (context, index, realIndex) {
                          final item = carouserpro.carouseldata[index];
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                scale: isTablet ? 18 : 22,
                                alignment: Alignment.bottomRight,
                                image: AssetImage(item.image),
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              color: const Color.fromARGB(255, 151, 216, 253),
                            ),
                            child: Padding(
                              padding: isTablet
                                  ? const EdgeInsets.only(left: 30, top: 40)
                                  : const EdgeInsets.only(left: 18, top: 33),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.subtitle,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: isTablet ? 18 : 16,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  SizedBox(
                                    height: isTablet ? 12 : 6,
                                  ),
                                  Text(
                                    "${item.subtitle}}",
                                    style: TextStyle(
                                      fontSize: isTablet ? 14 : 12,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  SizedBox(
                                    height: isTablet ? 20 : 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        // carouserpro.nextPage();
                                        // carouserpro.notifyListeners();
                                      },
                                      child: const SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
                ),

                const SizedBox(
                  height: 15,
                ),

                //slide indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    carouserpro.carouseldata.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Consumer<CarouselProvider>(
                          builder: (context, value, child) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              height: 4,
                              width:
                                  index == carouserpro.currentIndex ? 31 : 16,
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
                Padding(
                  padding: isTablet
                      ? const EdgeInsets.only(left: 50, right: 50)
                      : const EdgeInsets.only(
                          left: 25,
                          right: 25,
                        ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/Homesubcategory',
                      );
                    },
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        crossAxisSpacing: isTablet ? 40 : 20.0,
                        mainAxisSpacing: isTablet ? 40 : 20.0,
                        childAspectRatio: 1.0,
                        mainAxisExtent: isTablet
                            ? 400
                            : 200, // Aspect ratio of the grid items
                      ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.8, color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: isTablet ? 250 : 125,
                                width: isTablet ? 250 : 125,
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/vegitables.png",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: isTablet ? 60 : 30,
                                width: isTablet ? 250 : 125,
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Vegetables",
                                      style: TextStyle(
                                        fontSize: isTablet ? 28 : 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: isTablet ? 30 : 20,
                                      color: Colors.green[300],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
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
  }
}
