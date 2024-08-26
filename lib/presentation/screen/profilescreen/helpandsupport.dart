import 'package:customersouqjumla/presentation/screen/homescreen/widgets/subheadingwidgets.dart';
import 'package:customersouqjumla/presentation/widgets/appbarreusable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Helpandsupport extends StatelessWidget {
  Helpandsupport({Key? key}) : super(key: key);

  List<String> helpandSupportNavigationpages = [
    '/contact',
    '/Registerandcomplaints',
    '/faqs'
  ];

  List<String> helpandSupportNames = [
    'Contact',
    'Register And Conplaints',
    'FAQs'
  ];

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
        automaticallyImplyLeading1: true,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        bool isTablet = constraints.maxWidth > 600;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            subheadingwidget(
              heading: "Help & Support",
              isTablet: isTablet,
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: isTablet
                  ? const EdgeInsets.only(left: 50, right: 50)
                  : const EdgeInsets.only(left: 25, right: 25),
              child: ListView.separated(
                itemCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return helpandsupportlist(
                    leading: helpandSupportNames[index].toString(),
                    onTapString:
                        helpandSupportNavigationpages[index].toString(),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20,
                  );
                },
              ),
            )
          ],
        );
      }),
    );
  }
}

class helpandsupportlist extends StatelessWidget {
  const helpandsupportlist({
    super.key,
    this.leading,
    this.onTapString,
  });

  final String? leading;
  final String? onTapString;

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
          print("Navigating to");
          Navigator.pushNamed(context, '$onTapString');
        },
        leading: Text(
          "$leading",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.green,
        ),
      ),
    );
  }
}
