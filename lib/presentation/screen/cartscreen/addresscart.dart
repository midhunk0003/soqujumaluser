import 'package:customersouqjumla/presentation/screen/cartscreen/widget/popupalertcart.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/widgets/subheadingwidgets.dart';
import 'package:customersouqjumla/presentation/widgets/appbarreusable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Addresscart extends StatefulWidget {
  Addresscart({Key? key}) : super(key: key);

  @override
  State<Addresscart> createState() => _AddresscartState();
}

class _AddresscartState extends State<Addresscart> {
  TextEditingController _houseNameController = TextEditingController();
  TextEditingController _addressLineController = TextEditingController();
  TextEditingController _addressLine2Controller = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _zipcodeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  Color _borderColor = Colors.grey;
  String? selectedValue;
  List<String> dropvalue = ['option1', 'option2', 'option3', 'option4'];

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
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                subheadingwidget(heading: "Cart", isTablet: isTablet),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: isTablet
                      ? const EdgeInsets.only(left: 50, right: 50)
                      : const EdgeInsets.only(left: 25, right: 25),
                  child: Container(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Delivery Address",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          //1
                          TextFormWidgetcustom(
                            borderColor: _borderColor,
                            addressLineController: _houseNameController,
                            width: 340,
                            height: 52,
                            hintTextname: "House name/Number",
                          ),

                          SizedBox(
                            height: isTablet ? 40 : 20,
                          ),
                          //2
                          TextFormWidgetcustom(
                              borderColor: _borderColor,
                              addressLineController: _addressLineController,
                              width: 340,
                              height: 52,
                              hintTextname: "Address lane 1"),

                          SizedBox(
                            height: isTablet ? 40 : 20,
                          ),
                          //3
                          TextFormWidgetcustom(
                              borderColor: _borderColor,
                              addressLineController: _addressLine2Controller,
                              width: 340,
                              height: 52,
                              hintTextname: "Address lane 2"),

                          SizedBox(
                            height: isTablet ? 40 : 20,
                          ),
                          //4
                          TextFormWidgetcustom(
                              borderColor: _borderColor,
                              addressLineController: _districtController,
                              width: 340,
                              height: 52,
                              hintTextname: "Jumeirah"),

                          SizedBox(
                            height: isTablet ? 40 : 20,
                          ),
                          //5
                          Row(
                            children: [
                              Expanded(
                                child: TextFormWidgetcustom(
                                    borderColor: _borderColor,
                                    addressLineController: _countryController,
                                    width: 160,
                                    height: 52,
                                    hintTextname: "Dubai"),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: TextFormWidgetcustom(
                                  borderColor: _borderColor,
                                  addressLineController: _countryController,
                                  width: 160,
                                  height: 52,
                                  hintTextname: "Zip Code",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          SizedBox(
                            height: 10,
                          ),

                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                child: Checkbox(
                                  value: false,
                                  onChanged: (context) {},
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Remember this address for future orders"),
                            ],
                          ),

                          SizedBox(
                            height: isTablet ? 120 : 60,
                          ),

                          Text(
                            "Schedule Delivery",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: isTablet ? 40 : 20,
                          ),

                          DropdownButtonFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintStyle: TextStyle(
                                color: Colors
                                    .grey, // Change this to your desired color
                                fontSize:
                                    13.0, // Change this to your desired font size
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 20,
                              ),
                            ),
                            hint: Text("select Day"),
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
                            height: isTablet ? 40 : 20,
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: TextFormWidgetcustom(
                                  borderColor: _borderColor,
                                  addressLineController: _countryController,
                                  width: 102,
                                  height: 52,
                                  hintTextname: "Hours",
                                ),
                              ),
                              SizedBox(
                                width: 13,
                              ),
                              Expanded(
                                child: TextFormWidgetcustom(
                                  borderColor: _borderColor,
                                  addressLineController: _countryController,
                                  width: 102,
                                  height: 52,
                                  hintTextname: "Minutes",
                                ),
                              ),
                              SizedBox(
                                width: 13,
                              ),
                              Expanded(
                                child: DropdownButtonFormField(
                                  // alignment: Alignment.center,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    hintStyle: TextStyle(
                                      color: Colors
                                          .grey, // Change this to your desired color
                                      fontSize:
                                          13.0, // Change this to your desired font size
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 20,
                                    ),
                                  ),
                                  hint: Text("AM"),
                                  isDense:
                                      true, // Makes the dropdown more compact
                                  isExpanded:
                                      true, // Ensures that the dropdown takes the full width
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
                                      return "AM";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 30,
                          ),
                          //button
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                conformedplacedpopup(context);
                                print("validate succ");
                              } else {
                                print("not  validate");
                              }
                            },
                            child: Container(
                              height: isTablet ? 100 : 50,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "Continue",
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
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class TextFormWidgetcustom extends StatelessWidget {
  const TextFormWidgetcustom({
    super.key,
    required Color borderColor,
    required TextEditingController addressLineController,
    required this.width,
    required this.height,
    required this.hintTextname,
  })  : _borderColor = borderColor,
        _addressLineController = addressLineController;

  final Color _borderColor;
  final TextEditingController _addressLineController;
  final double width;
  final double height;
  final String hintTextname;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _addressLineController,
      decoration: InputDecoration(
        hintText: "$hintTextname",
        hintStyle: TextStyle(
          color: Colors.grey, // Change this to your desired color
          fontSize: 13.0, // Change this to your desired font size
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(12.0), // Customize the border radius
          borderSide: BorderSide(
            color: Colors.grey, // Customize the border color
            width: 2.0, // Customize the border width
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "$hintTextname";
        } else {
          return null;
        }
      },
    );
  }
}
