import 'package:flutter/material.dart';
import 'package:soccer_vault/models/teamsModel.dart';
import 'package:soccer_vault/screens/home_screen.dart';

import '../../app_textfieldformfield.dart';
import '../../const.dart';
import '../../httpService.dart';
import '../../popup/custom_alert.dart';
import '../../popup/teams_popup.dart';

class TeamsPage extends StatefulWidget {
  const TeamsPage({super.key});

  @override
  State<TeamsPage> createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  final searchController = TextEditingController();
  //List? teams;
  // final RootResponse teams = fetchMockTeams();
  List<Tournament>? originalTeam;
  List<Tournament> filteredTeam = [];
  TeamData teamData = TeamData();
  String totalMatches = "";
  bool isLoading = true;

  @override
  void initState() {
    fetchTeamStatistics();
    super.initState();
  }

  fetchTeamStatistics() async {
    try {
      teamData = await Services().getTeamStatistics();

      originalTeam = teamData.tournaments;
      filteredTeam = List.from(originalTeam!);
      totalMatches = teamData.totalMatches.toString();

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
        filteredTeam = List.from(originalTeam!);
      });
    } else {
      setState(() {
        filteredTeam = originalTeam!.where((data) {
          String lowercaseTournament =
              data.tournament!.toLowerCase().toLowerCase();
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
                  "Teams",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: darkBlackColor),
                ),
                SizedBox(
                  width: 20,
                )
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
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text("Total Matches: $totalMatches  ")],
            ),
            const SizedBox(
              height: 10,
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
                            itemCount: filteredTeam.length,
                            itemBuilder: (context, index) {
                              var tournament = filteredTeam[index];
                              return Card(
                                elevation: 1,
                                child: ListTile(
                                  onTap: () {
                                    showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (BuildContext context) =>
                                            CustomAlert(
                                              dialogueWidget: TeamsPopup(
                                                data: tournament,
                                              ),
                                            ));
                                  },
                                  title: Text(tournament.tournament.toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600)),
                                  subtitle: Text(
                                      'Matches Played: ${tournament.matchesPlayed.toString()}\nWinning Matches: ${tournament.winningMatches.toString()}'),
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
