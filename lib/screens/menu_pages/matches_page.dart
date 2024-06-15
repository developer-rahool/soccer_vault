import 'package:flutter/material.dart';
import 'package:soccer_vault/httpService.dart';
import 'package:soccer_vault/screens/home_screen.dart';

import '../../app_textfieldformfield.dart';
import '../../const.dart';
import '../../models/matchesModel.dart';
import '../../popup/custom_alert.dart';
import '../../popup/matches_popup.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  final searchController = TextEditingController();
  List<MatchModel> originalMatches = [];
  List<MatchModel> filteredMatches = [];
  bool isLoading = true;

  @override
  void initState() {
    fetchMatches();
    super.initState();
  }

  fetchMatches() async {
    try {
      var matches = await Services().getMatchesByYear();
      for (var data in matches) {
        originalMatches.add(data);
      }

      filteredMatches = List.from(originalMatches);
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
        filteredMatches = List.from(originalMatches);
      });
    } else {
      setState(() {
        filteredMatches = originalMatches.where((data) {
          String lowercaseTournament = data.tournament.toString().toLowerCase();
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
                  "Matches By Year",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: darkBlackColor),
                ),
                SizedBox()
                //IconButton(onPressed: (), icon: icon)
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
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: SizedBox(
                        height: screenHeight(context) * 0.78,
                        width: double.infinity,
                        child: Card(
                          color: Colors.white,
                          elevation: 1.5,
                          child: ListView.builder(
                            itemCount: filteredMatches.length,
                            itemBuilder: (context, index) {
                              final match = filteredMatches[index];
                              return Card(
                                elevation: 1,
                                child: ListTile(
                                  onTap: () {
                                    showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (BuildContext context) =>
                                            CustomAlert(
                                              dialogueWidget: MatchesPopup(
                                                data: match,
                                              ),
                                            ));
                                  },
                                  title: Text(
                                      '${match.homeTeam} vs ${match.awayTeam}',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600)),
                                  subtitle:
                                      Text('Tournament: ${match.tournament}'),
                                  trailing: Text('${match.date}'),
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
