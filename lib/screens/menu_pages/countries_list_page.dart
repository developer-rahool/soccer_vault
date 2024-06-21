import 'package:flutter/material.dart';

import '../../app_textfieldformfield.dart';
import '../../const.dart';
import 'country_matches_records.dart';

class CountriesListPage extends StatefulWidget {
  const CountriesListPage({super.key});

  @override
  State<CountriesListPage> createState() => _CountriesListPageState();
}

class _CountriesListPageState extends State<CountriesListPage> {
  final searchController = TextEditingController();
  List<String> originalCountryList = [];
  List<String> filteredCountryList = [];
  bool isLoading = false;

  @override
  void initState() {
    fetchTournaments();
    super.initState();
  }

  fetchTournaments() async {
    isLoading = true;
    searchController.clear();
    originalCountryList = countriesList;
    filteredCountryList = List.from(originalCountryList);

    isLoading = false;
  }

  void searchByAlphabet(String query, BuildContext context) {
    if (query.isEmpty) {
      filteredCountryList = List.from(originalCountryList);
    } else {
      filteredCountryList = originalCountryList.where((data) {
        String lowercaseTournament = data.toString().toLowerCase();
        String lowercaseSearchQuery = query.toLowerCase();
        return lowercaseSearchQuery
            .split('')
            .every((letter) => lowercaseTournament.contains(letter));
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightBlackColor,
        appBar: AppBarWidget(title: "Countries"),
        body: Padding(
          padding: mainPadding,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              AppTextFormField(
                appController: searchController,
                height: 40,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                maxLengthLine: 1,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black45,
                ),
                hintText: "Search by country",
                onChanged: (query) {
                  setState(() {
                    searchByAlphabet(query!, context);
                  });

                  return;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : filteredCountryList.isEmpty
                        ? const Center(
                            child: Text("No Records",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                          )
                        : SingleChildScrollView(
                            child: SizedBox(
                              height: screenHeight(context) * 0.76,
                              width: double.infinity,
                              child: ListView.builder(
                                itemCount: filteredCountryList.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    elevation: 1,
                                    child: ListTile(
                                      onTap: () {
                                        nextPage(
                                            context,
                                            CountryRecordPage(
                                              countryName:
                                                  filteredCountryList[index],
                                            ));
                                      },
                                      title: Text(filteredCountryList[index]),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
              )
            ],
          ),
        ));
  }
}
