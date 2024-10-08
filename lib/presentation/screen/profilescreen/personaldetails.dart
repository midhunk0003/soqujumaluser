import 'package:customersouqjumla/presentation/provider/profileprovider/profileprovider.dart';
import 'package:customersouqjumla/presentation/screen/cartscreen/widget/popupalertcart.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/widgets/subheadingwidgets.dart';
import 'package:customersouqjumla/presentation/widgets/appbarreusable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class Personaldetails extends StatelessWidget {
  Personaldetails({Key? key}) : super(key: key);

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _avenueController = TextEditingController();
  TextEditingController _buildingController = TextEditingController();

  TextEditingController _floorController = TextEditingController();
  TextEditingController _apartmentController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _governateController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _blocController = TextEditingController();

  String? selectedValue;
  List<String> dropvalue = ['option1', 'option2', 'option3', 'option4'];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Profileprovider>(context, listen: false).getUserProfile();
      final userDataPro = Provider.of<Profileprovider>(context, listen: false);
      _firstNameController.text = "${userDataPro.userData?.firstname}";
      _lastNameController.text = userDataPro.userData?.lastname != null
          ? "${userDataPro.userData?.lastname}"
          : '';
      _phoneNumberController.text = "${userDataPro.userData?.phone}";
      _streetController.text = userDataPro.userData?.street != null
          ? "${userDataPro.userData?.street}"
          : '';
      _avenueController.text = userDataPro.userData?.avenue != null
          ? "${userDataPro.userData?.avenue}"
          : '';
      _buildingController.text = userDataPro.userData?.building != null
          ? "${userDataPro.userData?.building}"
          : '';

      _floorController.text = "${userDataPro.userData?.floor}";
      _apartmentController.text = "${userDataPro.userData?.apartment}";
      _countryController.text = "${userDataPro.userData?.emirate!.engTitle}";
      _governateController.text =
          "${userDataPro.userData?.governorate!.engTitle}";
      _cityController.text = "${userDataPro.userData?.city!.engTitle}";
      _blocController.text = "${userDataPro.userData?.phone}";
    });

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
                  height: 25,
                ),
                subheadingwidget(
                  heading: "Personal Details",
                  isTablet: isTablet,
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: isTablet
                      ? const EdgeInsets.only(left: 50, right: 50)
                      : const EdgeInsets.only(left: 25, right: 25),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormWidgetcustom(
                          borderColor: Colors.grey,
                          addressLineController: _firstNameController,
                          width: 102,
                          height: 52,
                          hintTextname: "First Name",
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormWidgetcustom(
                          borderColor: Colors.grey,
                          addressLineController: _lastNameController,
                          width: 102,
                          height: 52,
                          hintTextname: "Last Name",
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormWidgetcustom(
                          borderColor: Colors.grey,
                          addressLineController: _phoneNumberController,
                          width: 102,
                          height: 52,
                          hintTextname: "Phone Number",
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormWidgetcustom(
                          borderColor: Colors.grey,
                          addressLineController: _streetController,
                          width: 102,
                          height: 52,
                          hintTextname: "Address",
                        ),
                        // SizedBox(
                        //   height: 25,
                        // ),
                        // DropdownButtonFormField(
                        //   decoration: InputDecoration(
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(12),
                        //     ),
                        //     hintStyle: TextStyle(
                        //       color: Colors
                        //           .grey, // Change this to your desired color
                        //       fontSize:
                        //           13.0, // Change this to your desired font size
                        //     ),
                        //     contentPadding: EdgeInsets.symmetric(
                        //       vertical: 15,
                        //       horizontal: 20,
                        //     ),
                        //   ),
                        //   hint: Text("Emirate"),
                        //   value: selectedValue,
                        //   items: dropvalue.map((String? dropvaluenew) {
                        //     return DropdownMenuItem(
                        //       value: dropvaluenew,
                        //       child: Text(dropvaluenew!),
                        //     );
                        //   }).toList(),
                        //   onChanged: (newValue) {
                        //     selectedValue = newValue;
                        //   },
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return "please select the day";
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        // ),

                        SizedBox(
                          height: 25,
                        ),

                        TextFormWidgetcustom(
                          borderColor: Colors.grey,
                          addressLineController: _avenueController,
                          width: 102,
                          height: 52,
                          hintTextname: "avenue",
                        ),
                        SizedBox(
                          height: 25,
                        ),

                        TextFormWidgetcustom(
                          borderColor: Colors.grey,
                          addressLineController: _buildingController,
                          width: 102,
                          height: 52,
                          hintTextname: "Building",
                        ),

                        SizedBox(
                          height: 25,
                        ),

                        TextFormWidgetcustom(
                          borderColor: Colors.grey,
                          addressLineController: _floorController,
                          width: 102,
                          height: 52,
                          hintTextname: "floor",
                        ),

                        SizedBox(
                          height: 25,
                        ),

                        TextFormWidgetcustom(
                          borderColor: Colors.grey,
                          addressLineController: _apartmentController,
                          width: 102,
                          height: 52,
                          hintTextname: "appartment",
                        ),

                        SizedBox(
                          height: 25,
                        ),

                        TextFormWidgetcustom(
                          borderColor: Colors.grey,
                          addressLineController: _countryController,
                          width: 102,
                          height: 52,
                          hintTextname: "country",
                        ),

                        SizedBox(
                          height: 25,
                        ),

                        TextFormWidgetcustom(
                          borderColor: Colors.grey,
                          addressLineController: _governateController,
                          width: 102,
                          height: 52,
                          hintTextname: "governorate",
                        ),

                        SizedBox(
                          height: 25,
                        ),

                        TextFormWidgetcustom(
                          borderColor: Colors.grey,
                          addressLineController: _cityController,
                          width: 102,
                          height: 52,
                          hintTextname: "city",
                        ),

                        // SizedBox(
                        //   height: 25,
                        // ),

                        // TextFormWidgetcustom(
                        //   borderColor: Colors.grey,
                        //   addressLineController: _blocController,
                        //   width: 102,
                        //   height: 52,
                        //   hintTextname: "Block",
                        // ),

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
                              final firstname = _firstNameController.text;
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
