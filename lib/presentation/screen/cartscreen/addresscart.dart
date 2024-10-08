import 'package:customersouqjumla/presentation/provider/placeorder/placeorderprovider.dart';
import 'package:customersouqjumla/presentation/screen/cartscreen/widget/popupalertcart.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/widgets/subheadingwidgets.dart';
import 'package:customersouqjumla/presentation/widgets/appbarreusable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Addresscart extends StatefulWidget {
  final int? storeId;
  Addresscart({Key? key, required this.storeId}) : super(key: key);

  @override
  State<Addresscart> createState() => _AddresscartState();
}

class _AddresscartState extends State<Addresscart> {
  TextEditingController _houseNameController = TextEditingController();
  TextEditingController _addressLineController = TextEditingController();
  TextEditingController _addressLine2Controller = TextEditingController();
  TextEditingController _phonenumberController = TextEditingController();
  TextEditingController _floorController = TextEditingController();
  TextEditingController _apartmentController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _paymentController = TextEditingController();

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
            return Stack(
              children: [
                Column(
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
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormWidgetcustom(
                                      borderColor: _borderColor,
                                      addressLineController:
                                          _firstNameController,
                                      width: 160,
                                      height: 52,
                                      hintTextname: "First Name",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: TextFormWidgetcustom(
                                      borderColor: _borderColor,
                                      addressLineController:
                                          _lastNameController,
                                      width: 160,
                                      height: 52,
                                      hintTextname: "Last Name",
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
                              //2
                              TextFormWidgetcustom(
                                borderColor: _borderColor,
                                addressLineController: _addressLineController,
                                width: 340,
                                height: 52,
                                hintTextname: "Address lane 1",
                              ),

                              SizedBox(
                                height: isTablet ? 40 : 20,
                              ),
                              //3
                              TextFormWidgetcustom(
                                borderColor: _borderColor,
                                addressLineController: _addressLine2Controller,
                                width: 340,
                                height: 52,
                                hintTextname: "Address lane 2",
                              ),

                              SizedBox(
                                height: isTablet ? 40 : 20,
                              ),
                              //4
                              TextFormWidgetcustom(
                                borderColor: _borderColor,
                                addressLineController: _phonenumberController,
                                width: 340,
                                height: 52,
                                hintTextname: "Phone",
                              ),

                              SizedBox(
                                height: isTablet ? 40 : 20,
                              ),
                              TextFormWidgetcustom(
                                borderColor: _borderColor,
                                addressLineController: _floorController,
                                width: 340,
                                height: 52,
                                hintTextname: "Floor",
                              ),
                              SizedBox(
                                height: isTablet ? 40 : 20,
                              ),
                              TextFormWidgetcustom(
                                borderColor: _borderColor,
                                addressLineController: _apartmentController,
                                width: 340,
                                height: 52,
                                hintTextname: "apartment",
                              ),
                              // SizedBox(
                              //   height: isTablet ? 40 : 20,
                              // ),
                              // TextFormWidgetcustom(
                              //   borderColor: _borderColor,
                              //   addressLineController: _dateController,
                              //   width: 340,
                              //   height: 52,
                              //   hintTextname: "Date",
                              // ),
                              SizedBox(
                                height: isTablet ? 40 : 20,
                              ),

                              TextFormWidgetcustom(
                                borderColor: _borderColor,
                                addressLineController: _paymentController,
                                width: 340,
                                height: 52,
                                hintTextname: "Payment Method",
                                readOnly: true,
                                onTap: true,
                                paymentType: _paymentController.text,
                              ),
                              SizedBox(
                                height: isTablet ? 40 : 20,
                              ),

                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      print("asdasdasda");
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      child: Checkbox(
                                        value: false,
                                        onChanged: (context) {},
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Remember this address for future orders",
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 30,
                              ),
                              //button
                              Consumer<Placeorderprovider>(
                                builder: (context, placeOrderProvider, child) {
                                  return GestureDetector(
                                    onTap: () async {
                                      if (_formKey.currentState!.validate()) {
                                        final storeId = widget.storeId;
                                        final issave = true;
                                        final housename = _houseNameController
                                            .text
                                            .toString();
                                        final addressline1 =
                                            _addressLineController.text
                                                .toString();
                                        final phone = _phonenumberController
                                            .text
                                            .toString();
                                        final addressline2 =
                                            _addressLine2Controller.text
                                                .toString();
                                        final floor =
                                            _floorController.text.toString();
                                        final apartment = _apartmentController
                                            .text
                                            .toString();
                                        final firstname = _firstNameController
                                            .text
                                            .toString();
                                        final lastname =
                                            _lastNameController.text.toString();
                                        final paymenttype =
                                            _paymentController.text.toString();
                                        // final date = DateTime.now();
                                        final date = DateTime.now();
                                        final formattedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .format(date);

                                        await placeOrderProvider.placeOrder(
                                          storeId.toString(),
                                          issave,
                                          housename,
                                          addressline1,
                                          phone,
                                          addressline2,
                                          floor,
                                          apartment,
                                          firstname,
                                          lastname,
                                          paymenttype,
                                          formattedDate.toString(),
                                        );
                                        conformedplacedpopup(context, storeId);
                                        print("validate succ");
                                      } else {
                                        print("not  validate");
                                      }
                                    },
                                    child: Container(
                                      height: isTablet ? 100 : 50,
                                      decoration: BoxDecoration(
                                        color:
                                            placeOrderProvider.isLoading == true
                                                ? Colors.grey
                                                : Colors.green,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          placeOrderProvider.isLoading == true
                                              ? "Loading..."
                                              : "Continue",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
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
                ),
                Consumer<Placeorderprovider>(
                  builder: (context, placeOrderProvider, child) {
                    return placeOrderProvider.isLoading == true
                        ? Container(
                            // width: double.infinity,
                            height: isTablet ? 1150 : 850,
                            // height: 900,
                            color: Colors.black.withOpacity(0.4),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : SizedBox();
                  },
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
  final Color? borderColor;
  final TextEditingController? addressLineController;
  final double width;
  final double height;
  final String hintTextname;
  final bool? readOnly;
  final bool? onTap;
  final String? paymentType;

  const TextFormWidgetcustom({
    super.key,
    this.borderColor,
    this.addressLineController,
    this.onTap,
    required this.width,
    required this.height,
    required this.hintTextname,
    this.readOnly,
    this.paymentType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap != null
          ? () {
              print("ajshfkjaghskjfgaksjgfkjsa");
              _showAlertDialog(context, paymentType);
            }
          : null,
      readOnly: readOnly != null ? true : false,
      controller: addressLineController,
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

  void _showAlertDialog(BuildContext context, paymentType) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? changedValueradio;
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('SELECT YOUR PAYMENT TYPE'),
              content: Container(
                height: 190,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: Colors.grey,
                          border: Border.all(color: Colors.green)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "CASH",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Radio<String>(
                            value: "Cash",
                            groupValue: addressLineController!.text,
                            onChanged: (String? value) {
                              setState(() {
                                addressLineController!.text = value!;
                              });
                              Navigator.pop(context, changedValueradio);
                              print(addressLineController!.text);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: Colors.grey,
                          border: Border.all(color: Colors.green)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Other1",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Radio<String>(
                            value: "Other1",
                            groupValue: addressLineController!.text,
                            onChanged: (String? value) {
                              setState(() {
                                addressLineController!.text = value!;
                              });
                              Navigator.pop(context, changedValueradio);
                              print(addressLineController!.text);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: Colors.grey,
                          border: Border.all(color: Colors.green)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Other2",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Radio<String>(
                            value: "Other2",
                            groupValue: addressLineController!.text,
                            onChanged: (String? value) {
                              setState(() {
                                addressLineController!.text = value!;
                              });
                              Navigator.pop(context, changedValueradio);
                              print(addressLineController!.text);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
