import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void conformedplacedpopup(BuildContext context, int? storeId) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Container(
          // color: Colors.white,
          width: 340,
          height: 423,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  // width: 100,
                  height: 200,
                  child:
                      LottieBuilder.asset("assets/json/successordered.json")),
              Text(
                "CONGRATULATIONS",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      text: "Your order has been placed\n",
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                      children: [
                        TextSpan(
                            text: "successfully and will be \n delivering "),
                        TextSpan(
                          text: "TODAY ",
                          style: TextStyle(
                            color: Colors.green,
                          ), // Change the color of "TODAY"
                        ),
                        TextSpan(
                          text: "at 07:45 PM",
                          style: TextStyle(
                            color: Colors.green,
                          ), // Change the color of "TODAY"
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/bottomnavbar',
                    arguments: {'storeId': storeId},
                  );
                },
                child: Container(
                  height: 50,
                  width: 280,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Back to Home",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
