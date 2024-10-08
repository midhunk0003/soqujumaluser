import 'package:customersouqjumla/presentation/provider/homeprovider/category_provider.dart';
import 'package:customersouqjumla/presentation/provider/selectstoreprovider/selectstoreprovider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Selectstorescreen extends StatelessWidget {
  const Selectstorescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Selectstoreprovider>(context, listen: false).getStoreList();
    });
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.location_pin,
              color: Colors.green,
            ),
            const SizedBox(
              width: 4,
            ),
            const Text("Location name"),
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/enterlocation',
                    (route) => false,
                  );
                },
                child: const Text('change location'),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Consumer2<Selectstoreprovider, CategoryProvider>(
          builder: (context, selectstoreProvider, categoryProvider, child) {
            final datastoreList = selectstoreProvider.storeList;

            print("10000000000000001111111111 : ${datastoreList!.length}");

            if (selectstoreProvider.isLoading == true) {
              return Center(
                child: Lottie.asset(
                  'assets/json/loadingcircle.json',
                  width: 200,
                  height: 150,
                  fit: BoxFit.fill,
                ),
              );
            } else if (selectstoreProvider.errorMessage != null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${selectstoreProvider.errorMessage}"),
                    ElevatedButton(
                      onPressed: () {
                        selectstoreProvider.getStoreList();
                      },
                      child: Text("Retry"),
                    )
                  ],
                ),
              );
            }
            return datastoreList.isNotEmpty
                ? LayoutBuilder(
                    builder: (context, constraints) {
                      bool isTablet = constraints.maxWidth >= 600;
                      return Padding(
                        padding: EdgeInsets.all(isTablet ? 50 : 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Select the store where\nyou want to shop',
                              style: TextStyle(
                                fontSize: isTablet ? 26 : 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Expanded(
                              child: Container(
                                child: ListView.separated(
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                      height: 20,
                                    ); // Space between items
                                  },
                                  itemCount: datastoreList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        // print("${dataList[index].id}");
                                        categoryProvider.getCategory(
                                            '${datastoreList[index].id}');
                                        final storeId = datastoreList[index].id;
                                        print("cat id : $storeId");
                                        
                                        Navigator.pushNamed(
                                          context,
                                          '/bottomnavbar',
                                          arguments: {'storeId': storeId},
                                        );
                                      },
                                      child: Container(
                                        height: isTablet ? 100 : 80,
                                        decoration: BoxDecoration(
                                          // color: Colors.yellow,
                                          border: Border.all(
                                            color: Colors.black, // Border color
                                            width: .7, // Border width
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                height: isTablet ? 50 : 35,
                                                width: isTablet ? 90 : 65,
                                                decoration: BoxDecoration(
                                                  // color: const Color.fromARGB(
                                                  //     255, 255, 255, 255),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      'https://souq-jumla.noviindusdemosites.in/${datastoreList[index].image}',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 23,
                                              ),
                                              Text(
                                                "${datastoreList[index].engTitle}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: isTablet ? 18 : 15,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 23,
                                              ),
                                              Flexible(
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Colors.green,
                                                  size: isTablet ? 36 : 30,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('NO STORE IN THIS LOCATION'),
                        Lottie.asset(
                          'assets/json/empty.json',
                          width: 300,
                          height: 300,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
