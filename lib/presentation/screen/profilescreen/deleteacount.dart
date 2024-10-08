import 'package:customersouqjumla/presentation/provider/delete_provider/deleteprovider.dart';
import 'package:customersouqjumla/presentation/screen/homescreen/widgets/subheadingwidgets.dart';
import 'package:customersouqjumla/presentation/screen/profilescreen/widget/deleteaccountpopup.dart';
import 'package:customersouqjumla/presentation/screen/profilescreen/widget/logoutpopup.dart';
import 'package:customersouqjumla/presentation/widgets/appbarreusable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteAccount extends StatelessWidget {
  DeleteAccount({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _descriptionController = TextEditingController();
  // String? _selectedValue;

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
        child: Form(
          key: _formKey,
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isTablet = constraints.maxWidth > 600;

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  subheadingwidget(
                    heading: "Delete Account",
                    isTablet: isTablet,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: isTablet
                        ? const EdgeInsets.only(left: 50, right: 50)
                        : const EdgeInsets.only(left: 25, right: 25),
                    child: Text(
                      "We understand if you wish to delete your SouqJumla account. By proceeding, you'll lose access to your browsing history and stored information within the app. Please note that deleting your account means you'll no longer be able to access SouqJumla as a registered user.",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  bulletpointsdelete(
                    isTablet: isTablet,
                    text:
                        "If you still wish to proceed, kindly confirm your decision below. Remember, should you wish to use SouqJumla again in the future, you'll need to register as a new user. Thank you for being part of our community.",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  bulletpointsdelete(
                    isTablet: isTablet,
                    text:
                        "Deleting your SouqJumla account means losing access to your browsing history and stored information within the app.",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  bulletpointsdelete(
                    isTablet: isTablet,
                    text:
                        "Once deleted, you won't be able to access SouqJumla as a registered user.",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //form
                  Padding(
                    padding: isTablet
                        ? const EdgeInsets.only(left: 50, right: 50)
                        : const EdgeInsets.only(left: 25, right: 25),
                    child: Consumer<DeleteAccountprovider>(
                      builder: (context, deleteAccountProvider, child) {
                        return DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Select an option',
                            border: OutlineInputBorder(),
                          ),
                          value: deleteAccountProvider.selectedReason,
                          items: deleteAccountProvider.dropReason.map(
                            (String reason) {
                              return DropdownMenuItem<String>(
                                value: reason,
                                child: Text(reason),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            deleteAccountProvider.setSelectedReason(value);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a reason';
                            }
                            return null;
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: isTablet
                        ? const EdgeInsets.only(left: 50, right: 50)
                        : const EdgeInsets.only(left: 25, right: 25),
                    child: Container(
                      padding: isTablet
                          ? const EdgeInsets.only(left: 50, right: 50)
                          : const EdgeInsets.only(left: 25, right: 25),
                      height: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey)),
                      child: TextFormField(
                        controller: _descriptionController,
                        maxLines: null, // Allows the field to be multi-line
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(12),
                          // ),
                          border: InputBorder.none,
                          hintText: 'Enter your message or description here...',
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
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Consumer<DeleteAccountprovider>(
                    builder: (context, deleteAccountProvider, child) {
                      return Padding(
                        padding: isTablet
                            ? const EdgeInsets.only(left: 50, right: 50)
                            : const EdgeInsets.only(left: 25, right: 25),
                        child: GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              // conformedplacedpopup(context);
                              // final firstname = ;
                              print(
                                  "selected reason  ${deleteAccountProvider.selectedReason}");
                              print(
                                  "description  ${_descriptionController.text}");
                              showDilogfuncdeleteAccount(
                                  context,
                                  deleteAccountProvider.selectedReason,
                                  _descriptionController.text);
                            } else {
                              print("validate");
                            }
                          },
                          child: Container(
                            height: isTablet ? 50 : 50,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Delete Account",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class bulletpointsdelete extends StatelessWidget {
  final String? text;
  const bulletpointsdelete({
    super.key,
    required this.isTablet,
    required this.text,
  });

  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isTablet
          ? const EdgeInsets.only(left: 70, right: 50)
          : const EdgeInsets.only(left: 50, right: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(fontSize: 24)),
          Expanded(
            child: Text(
              '${text}',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
