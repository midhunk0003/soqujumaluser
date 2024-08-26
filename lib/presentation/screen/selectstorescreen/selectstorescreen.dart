import 'package:flutter/material.dart';

class Selectstorescreen extends StatelessWidget {
  const Selectstorescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(
              Icons.location_pin,
              color: Colors.green,
            ),
            const SizedBox(
              width: 4,
            ),
            const Text("Location name"),
            const SizedBox(
              width: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/enterlocation',
                  (route) => false,
                );
              },
              child: const Text('change location'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
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
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 20,
                          ); // Space between items
                        },
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              print("$index");
                              Navigator.pushNamed(context, '/bottomnavbar');
                            },
                            child: Container(
                              height: isTablet ? 100 : 80,
                              decoration: BoxDecoration(
                                // color: Colors.yellow,
                                border: Border.all(
                                  color: Colors.black, // Border color
                                  width: .7, // Border width
                                ),
                                borderRadius: BorderRadius.circular(20),
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
                                      decoration: const BoxDecoration(
                                        // color: const Color.fromARGB(
                                        //     255, 255, 255, 255),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/logo.png',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 23,
                                    ),
                                    Text(
                                      "Waitrose Supermarket",
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
        ),
      ),
    );
  }
}
