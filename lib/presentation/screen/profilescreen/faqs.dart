import 'package:customersouqjumla/presentation/provider/helpandsupportprovider/faqprovider.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/widgets/subheadingwidgets.dart';
import 'package:customersouqjumla/presentation/widgets/appbarreusable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class Faqs extends StatelessWidget {
  const Faqs({Key? key}) : super(key: key);

  // bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FaqProvider(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: Image(
            width: 92,
            image: AssetImage(
              'assets/images/logo.png',
            ),
          ),
          automaticallyImplyLeading1: true,
        ),
        body: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
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
                      child: Consumer<FaqProvider>(
                        builder: (context, faqProvider, child) {
                          return ListView.separated(
                            itemCount: faqProvider.questions.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final faq = faqProvider.questions[index];
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // print('hide and show');
                                      faqProvider.toogleVisibility(index);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors
                                                .grey), // Customize the border color
                                        borderRadius: BorderRadius.circular(
                                            8.0), // Optional: add rounded corners
                                      ),
                                      child: ListTile(
                                        leading:
                                            Text('${faq['question']}  $index'),
                                        trailing: faq['isVisible']
                                            ? Icon(Icons.arrow_upward)
                                            : Icon(Icons.arrow_forward_ios),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  AnimatedSize(
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                    child: Container(
                                      padding: EdgeInsets.all(10),

                                      height: faq['isVisible'] ? null : 0,
                                      // width: 340,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        // color: Colors.amber,
                                        border: Border.all(width: 1),
                                      ),
                                      child: Center(
                                          child: Text("${faq['answer']}")),
                                    ),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 10,
                              );
                            },
                          );
                        },
                      ))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
