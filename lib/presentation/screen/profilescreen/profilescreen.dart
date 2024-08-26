import 'package:customersouqjumla/presentation/screen/homescreen/widgets/subheadingwidgets.dart';
import 'package:customersouqjumla/presentation/screen/profilescreen/widget/logoutpopup.dart';
import 'package:customersouqjumla/presentation/widgets/appbarreusable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Profilescreen extends StatelessWidget {
  Profilescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> myAccountNavigatepages = [
      '/personaldetails',
      '/myorders',
      '/aboutus',
      '/helpandsupport',
      '/deleteaccount',
    ];

    final List<String> title = [
      'Personal Details',
      'My Orders',
      'About Us',
      'Help & Support',
    ];
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
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600;
            return Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                subheadingwidget(
                  heading: "My Account",
                  isTablet: isTablet,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: isTablet
                      ? const EdgeInsets.only(left: 50, right: 50)
                      : const EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return myaccountList(
                            title: title[index].toString(),
                            onTapString:
                                myAccountNavigatepages[index].toString(),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 20,
                          );
                        },
                        itemCount: 4,
                      ),
                      const SizedBox(
                        height: 90,
                      ),
                      GestureDetector(
                        onTap: () {
                          print("Logout");
                          showDilogfunc(context);
                        },
                        child: Container(
                          height: isTablet ? 50 : 50,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Log Out",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          // color: Colors.black,
                          border: Border.all(width: 0.6, color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: Text("Delete Account"),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class myaccountList extends StatelessWidget {
  final String? title;
  final String? onTapString;
  const myaccountList({
    super.key,
    this.title,
    this.onTapString,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.black,
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, '$onTapString');
        },
        leading: Text("$title"),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.green,
        ),
      ),
    );
  }
}
