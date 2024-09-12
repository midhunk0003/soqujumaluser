import 'package:customersouqjumla/data/model/enterlocation_model/block_list_model/block_list_model.dart';
import 'package:customersouqjumla/data/model/enterlocation_model/city_list_model/city_list_model.dart';
import 'package:customersouqjumla/data/model/enterlocation_model/country_list_model/country_list_model.dart';
import 'package:customersouqjumla/data/model/enterlocation_model/governerlist/governerlist.dart';
import 'package:customersouqjumla/presentation/provider/enterlocationprovider/enterlocationsprovider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Enterlocationscreen extends StatelessWidget {
  Enterlocationscreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Enterlocationsprovider>(context, listen: false)
          .getCountries();
    });
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
                          "countries",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Consumer<Enterlocationsprovider>(
                          builder: (context, enterLocationprovider, child) {
                            final countries =
                                enterLocationprovider.countries ?? [];
                            print(
                              "Ui countries List ${countries}",
                            );
                            return DropdownButtonFormField(
                              decoration: InputDecoration(
                                // suffixIcon: Icon(Icons.arrow_downward),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              hint: enterLocationprovider.isLoading
                                  ? Center(
                                      child: Text(
                                        "Loading.....",
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 4, 113, 202)),
                                      ),
                                    )
                                  : Text("Select the Emirate"),
                              value: enterLocationprovider.selectedCountryId,
                              items: countries.map((Country country) {
                                return DropdownMenuItem(
                                  value: country.id,
                                  child: Text(country.engTitle!),
                                );
                              }).toList(),
                              onChanged: (newvalue) async {
                                if (newvalue != null) {
                                  print('Selected country: ${newvalue}');
                                  // selectedCountryId = newvalue;
                                  enterLocationprovider.setSelectedCountryId(
                                    newvalue,
                                  );
                                  enterLocationprovider
                                      .governoratelist(newvalue.toString());
                                  enterLocationprovider
                                      .resetGovernorateAndCity();
                                }
                              },
                              validator: (value) {
                                if (value == null) {
                                  return "please select Country";
                                } else {
                                  return null;
                                }
                              },
                            );
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "governorate",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Consumer<Enterlocationsprovider>(
                          builder: (context, govlistprovider, child) {
                            final govlistshow = govlistprovider.listgov ?? [];
                            print("ui gov list : $govlistshow");
                            return DropdownButtonFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              hint: govlistprovider.isLoading
                                  ? Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Text(
                                            "Loading.....",
                                            style: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 4, 113, 202)),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Text("select your Governorat"),
                              value: govlistprovider.selectedGovernorateId,
                              items:
                                  govlistshow.map((Governorate governatelist) {
                                return DropdownMenuItem(
                                  value: governatelist.id,
                                  child: Text(governatelist.engTitle!),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                if (newValue != null) {
                                  // selectedgovid = newValue;
                                  // print("selected govid :$selectedgovid ");
                                  govlistprovider
                                      .setSelectedGovernorateId(newValue);
                                  govlistprovider
                                      .getcitylist(newValue.toString());
                                  govlistprovider.resetCity();
                                }
                              },
                              validator: (value) {
                                if (value == null) {
                                  return "please select a governate";
                                } else {
                                  return null;
                                }
                              },
                            );
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
                        Consumer<Enterlocationsprovider>(
                          builder: (context, cityProvider, child) {
                            final cityListShow = cityProvider.cityList ?? [];
                            print("ui city list : $cityListShow");
                            return DropdownButtonFormField<int>(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              hint: cityProvider.isLoading
                                  ? Center(
                                      child: Text(
                                        "Loading.....",
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 4, 113, 202)),
                                      ),
                                    )
                                  : Text("select your City"),
                              value: cityProvider.selectedCityId,
                              items: cityListShow.map((City city) {
                                return DropdownMenuItem(
                                  value: city.id,
                                  child: Text(city.engTitle!),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                if (newValue != null) {
                                  // selectedcityId = newValue;
                                  cityProvider.setSelectedCityId(newValue);
                                  cityProvider.getcityBloc(newValue.toString());
                                  cityProvider.resetCityBloc();
                                }
                              },
                              validator: (value) {
                                if (value == null) {
                                  return "please select a city";
                                } else {
                                  return null;
                                }
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: isTablet ? 30 : 30,
                        ),
                        const Text(
                          "Block",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: isTablet ? 10 : 10,
                        ),
                        Consumer<Enterlocationsprovider>(
                          builder: (context, cityblocProvider, child) {
                            final cityListShow =
                                cityblocProvider.cityBlocList ?? [];
                            print("ui city list : $cityListShow");
                            return DropdownButtonFormField<int>(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              hint: cityblocProvider.isLoading
                                  ? Center(
                                      child: Text(
                                        "Loading.....",
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 4, 113, 202)),
                                      ),
                                    )
                                  : Text("select your Block"),
                              value: cityblocProvider.selectedCityBlocId,
                              items: cityListShow.map((CityBlock citybloc) {
                                return DropdownMenuItem(
                                  value: citybloc.id,
                                  child: Text(citybloc.engTitle!),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                if (newValue != null) {
                                  // selectedcityId = newValue;
                                  cityblocProvider
                                      .setSelectCityBlocId(newValue);
                                }
                              },
                              validator: (value) {
                                if (value == null) {
                                  return "please select a bloc";
                                } else {
                                  return null;
                                }
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: isTablet ? 100 : 60,
                        ),
                        Consumer<Enterlocationsprovider>(
                          builder: (context, postProvider, child) {
                            return GestureDetector(
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  print("123");
                                  await postProvider
                                      .postTheProfileFromLocation();

                                  Navigator.pushNamed(
                                    context,
                                    '/selectstorescreen',
                                  );
                                }
                              },
                              child: Container(
                                height: isTablet ? 60 : 50,
                                decoration: BoxDecoration(
                                  color: postProvider.isLoading
                                      ? Colors.grey
                                      : Colors.green,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    postProvider.isLoading
                                        ? "Loading..."
                                        : "Find Stores",
                                    style: TextStyle(
                                      fontSize: isTablet ? 22 : 18,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
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
