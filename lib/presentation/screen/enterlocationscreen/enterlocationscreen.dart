import 'package:flutter/material.dart';

class Enterlocationscreen extends StatelessWidget {
  Enterlocationscreen({Key? key}) : super(key: key);

  String? selectedValue;
  final _formKey = GlobalKey<FormState>();
  List<String> dropvalue = ['option1', 'option2', 'option3', 'option4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet = constraints.maxWidth >= 600;
          return Padding(
            padding: isTablet
                ? const EdgeInsets.symmetric(horizontal: 100, vertical: 100)
                : const EdgeInsets.all(25),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: isTablet ? 100 : 90,
                    ),
                    Text(
                      "Enter your location\nto find stores near you.",
                      style: TextStyle(
                        fontSize: isTablet ? 28 : 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Emirate",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            // suffixIcon: Icon(Icons.arrow_downward),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          hint: Text("Select the Emirate"),
                          value: selectedValue,
                          items: dropvalue.map((String? dropvaluenew) {
                            return DropdownMenuItem(
                              value: dropvaluenew,
                              child: Text(dropvaluenew!),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            selectedValue = newValue;
                            print(selectedValue);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please select a emirate";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "City",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          hint: Text("select your city"),
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
                              return "please select a city";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Street",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          hint: Text("select your street"),
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
                              return "please select a emirate";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: isTablet ? 100 : 60,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              print("123");
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/selectstorescreen',
                                (route) => false,
                              );
                            }
                          },
                          child: Container(
                            height: isTablet ? 60 : 50,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Find Stores",
                                style: TextStyle(
                                  fontSize: isTablet ? 22 : 18,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
