import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class ValidateOtp extends StatelessWidget {
  ValidateOtp({Key? key}) : super(key: key);

  TextEditingController otppinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                decoration: const BoxDecoration(
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
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: isTablet ? 80 : 60, // More space for tablet
                      ),
                      Text(
                        'Enter OTP',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isTablet ? 20 : 16,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: isTablet ? 90 : 60,
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          // border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Pinput(
                          length: 5,
                          controller: otppinController,
                          defaultPinTheme: PinTheme(
                            width: isTablet ? 150 : 100,
                            height: isTablet ? 70 : 60,
                            textStyle: TextStyle(
                              fontSize: isTablet ? 26 : 22,
                              color: Colors.black,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[300], // Background color
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                          ),
                          separator: SizedBox(width: isTablet ? 16 : 8),
                        ),
                      ),
                      SizedBox(
                        height: isTablet ? 70 : 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (otppinController.text == '12345') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("LOGIN SUCCESS"),
                                backgroundColor: Colors.green,
                              ),
                            );
                            print("success");
                            Navigator.of(context).pushNamed('/enterlocation');
                          } else {
                            // PIN is invalid
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Please enter a valid 5-digit PIN.'),
                                backgroundColor: Colors.red,
                              ),
                            );
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
                                  "Verify",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isTablet
                                        ? 20
                                        : 16, // Larger font for tablet
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          print("resend otp");
                        },
                        child: const Text(
                          "Resend OTP",
                          style: TextStyle(
                            color: Colors.grey,
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
