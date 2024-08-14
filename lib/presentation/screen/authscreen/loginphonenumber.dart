import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Loginphonenumber extends StatelessWidget {
  Loginphonenumber({Key? key}) : super(key: key);

  TextEditingController countryController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  final phonekey = GlobalKey<FormState>();

  String? errorMessage;

  String? selectedCountryCode = "+91";
  final List<String> countryCode = ['+91', '+1', '+44', '+61', '+81'];

  @override
  Widget build(BuildContext context) {
    countryController.text = "+91";
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet = constraints.maxWidth > 600;
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/loginbg.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.black
                    .withOpacity(0.8), // Adjust the opacity as needed
              ),
              Padding(
                padding: EdgeInsets.all(isTablet ? 100 : 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: isTablet ? 100 : 70,
                      ),
                      Text(
                        'Login or Register\nWith Your Phone Number',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isTablet ? 32 : 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Lörem ipsum ivonar est der och ora Kelig.',
                        style: TextStyle(
                            fontSize: isTablet ? 18 : 13,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: isTablet ? 80 : 60, // More space for tablet
                      ),
                      Text(
                        'Sign up to get started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isTablet ? 20 : 16,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Form(
                        key: phonekey,
                        child: Container(
                          height: isTablet ? 60 : 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: isTablet ? 100 : 60,
                                child: DropdownButton<String>(
                                  value: selectedCountryCode,
                                  items: countryCode.map((String code) {
                                    return DropdownMenuItem<String>(
                                      value: code,
                                      child: Text(
                                        code,
                                        style: TextStyle(
                                          fontSize: isTablet ? 20 : 16,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    selectedCountryCode = newValue!;
                                    print(selectedCountryCode);
                                  },
                                  underline: SizedBox(),
                                ),
                              ),
                              Text(
                                "|",
                                style: TextStyle(
                                    fontSize: isTablet ? 36 : 33,
                                    color: Colors.grey),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: numberController,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Phone",
                                  ),
                                  style: TextStyle(
                                    fontSize: isTablet
                                        ? 20
                                        : 16, // Larger font for tablet
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: isTablet ? 70 : 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (numberController.text.isEmpty ||
                              countryController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Please enter your phone number'),
                                backgroundColor: Color.fromARGB(255, 212, 23,
                                    9), // Optional: Set background color
                                duration: Duration(
                                  seconds: 2,
                                ), // Optional: Set duration
                              ),
                            );
                          } else {
                            print(
                                '${selectedCountryCode}${numberController.text}');
                            Navigator.pushNamed(context, '/verifyOtp');
                          }
                        },
                        child: Container(
                          height: isTablet ? 60 : 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Get OTP",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isTablet
                                        ? 20
                                        : 16, // Larger font for tablet
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
