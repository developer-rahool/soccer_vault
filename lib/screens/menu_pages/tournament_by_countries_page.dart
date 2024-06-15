import 'package:flutter/material.dart';
import 'package:soccer_vault/models/tournament_by_countries_model.dart';
import 'package:soccer_vault/screens/home_screen.dart';

import '../../app_textfieldformfield.dart';
import '../../const.dart';
import '../../httpService.dart';
import '../../popup/countriesList_popup.dart';
import '../../popup/custom_alert.dart';

class CountryTournamentPage extends StatefulWidget {
  const CountryTournamentPage({super.key});

  @override
  State<CountryTournamentPage> createState() => _CountryTournamentPageState();
}

class _CountryTournamentPageState extends State<CountryTournamentPage> {
  final searchController = TextEditingController();
  List<CountryTournamentData> originalTournaments = [];
  List<CountryTournamentData> filteredTournaments = [];
  bool isLoading = true;

  @override
  void initState() {
    fetchCountriesByTournaments();
    super.initState();
  }

  fetchCountriesByTournaments() async {
    try {
      var tournamentModel = await Services().getCountriesByTournaments();

      originalTournaments = tournamentModel;
      filteredTournaments = List.from(originalTournaments);

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    }
  }

  void searchByAlphabet(String query, BuildContext context) {
    if (query.isEmpty) {
      setState(() {
        filteredTournaments = List.from(originalTournaments);
      });
    } else {
      setState(() {
        filteredTournaments = originalTournaments.where((data) {
          String lowercaseTournament = data.id.toString().toLowerCase();
          String lowercaseSearchQuery = query.toLowerCase();
          return lowercaseSearchQuery
              .split('')
              .every((letter) => lowercaseTournament.contains(letter));
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlackColor,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    nextPage(context, HomeScreen());
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    size: 18,
                    color: midBlackColor,
                  ),
                ),
                Text(
                  "Country List",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: darkBlackColor),
                ),
                SizedBox()
              ],
            ),
            SizedBox(
              height: 15,
            ),
            AppTextFormField(
              appController: searchController,
              height: 40,
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              maxLengthLine: 1,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black45,
              ),
              hintText: "Search",
              onChanged: (query) {
                setState(() {
                  searchByAlphabet(query!, context);
                });

                return;
              },
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: isLoading
                  ? Center(child: const CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: SizedBox(
                        height: screenHeight(context) * 0.78,
                        width: double.infinity,
                        child: Card(
                          color: Colors.white,
                          elevation: 1.5,
                          child: ListView.builder(
                            itemCount: filteredTournaments.length,
                            itemBuilder: (context, index) {
                              final tournament = filteredTournaments[index];
                              return Card(
                                elevation: 1,
                                child: ListTile(
                                  onTap: () {
                                    showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (BuildContext context) =>
                                            CustomAlert(
                                              dialogueWidget:
                                                  CountriesListPopup(
                                                data: tournament,
                                              ),
                                            ));
                                  },
                                  title: Text('${tournament.id}',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600)),
                                  subtitle:
                                      Text(tournament.teams?.join(', ') ?? ''),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
