import 'package:customersouqjumla/presentation/screen/homescreen/widgets/subheadingwidgets.dart';
import 'package:customersouqjumla/presentation/widgets/appbarreusable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Registerandcomplaints extends StatelessWidget {
  Registerandcomplaints({Key? key}) : super(key: key);

  TextEditingController _descriptionController = TextEditingController();
  String? selectedValue;
  List<String> dropvalue = ['option1', 'option2', 'option3', 'option4'];

  final _formKey = GlobalKey<FormState>();

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
      body: SingleChildScrollView(
        child: LayoutBuilder(builder: (context, constraints) {
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
              Form(
                key: _formKey,
                child: Padding(
                  padding: isTablet
                      ? const EdgeInsets.only(left: 50, right: 50)
                      : const EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Register a complaint",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        hint: Text("Complaint Regarding"),
                        value: selectedValue,
                        items: dropvalue.map((String? dropvaluenew) {
                          return DropdownMenuItem(
                            value: dropvaluenew,
                            child: Text(dropvaluenew!),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          selectedValue = newValue;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please select the day";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        hint: Text("Complaint Regarding"),
                        value: selectedValue,
                        items: dropvalue.map((String? dropvaluenew) {
                          return DropdownMenuItem(
                            value: dropvaluenew,
                            child: Text(dropvaluenew!),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          selectedValue = newValue;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please select the day";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 170,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey)),
                        child: TextFormField(
                          maxLines: null, // Allows the field to be multi-line
                          decoration: InputDecoration(
                            // border: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(12),
                            // ),
                            border: InputBorder.none,
                            hintText:
                                'Enter your message or description here...',
                            labelText: 'Description',
                          ),
                          keyboardType: TextInputType.multiline,

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter description";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),

                      SizedBox(
                        height: 25,
                      ),

                      //button
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            // conformedplacedpopup(context);
                            print("validate succ");
                          } else {
                            final firstname = _descriptionController.text;
                            print("not  validate  $firstname");
                          }
                        },
                        child: Container(
                          height: isTablet ? 50 : 50,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: isTablet ? 40 : 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
