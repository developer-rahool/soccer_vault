import 'package:flutter/material.dart';
import 'package:soccer_vault/models/tournamentModel.dart';
import 'package:soccer_vault/popup/tournamentsPopup.dart';
import 'package:soccer_vault/screens/home_screen.dart';

import '../../app_textfieldformfield.dart';
import '../../const.dart';
import '../../httpService.dart';
import '../../popup/custom_alert.dart';

class TournamentPage extends StatefulWidget {
  const TournamentPage({super.key});

  @override
  State<TournamentPage> createState() => _TournamentPageState();
}

class _TournamentPageState extends State<TournamentPage> {
  final searchController = TextEditingController();
  List<ListTournamentModel> originalTournament = [];
  List<ListTournamentModel> filteredTournament = [];
  bool isLoading = true;

  @override
  void initState() {
    // originalMatches = fetchMockTournament();
    // filteredMatches = List.from(originalMatches);
    fetchTournaments();
    super.initState();
  }

  fetchTournaments() async {
    try {
      var tournamentModel = await Services().getTournaments();

      originalTournament = tournamentModel;
      filteredTournament = List.from(originalTournament);

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
        filteredTournament = List.from(originalTournament);
      });
    } else {
      setState(() {
        filteredTournament = originalTournament.where((data) {
          String lowercaseTournament = data.lists.toString().toLowerCase();
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
                  "Tournament List",
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
                  ? Center(child: const CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: SizedBox(
                        height: screenHeight(context) * 0.78,
                        width: double.infinity,
                        child: Card(
                          color: Colors.white,
                          elevation: 1.5,
                          child: ListView.builder(
                            itemCount: filteredTournament.length,
                            itemBuilder: (context, index) {
                              final tournament = filteredTournament[index];
                              return Card(
                                elevation: 1,
                                child: ListTile(
                                  onTap: () {
                                    showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (BuildContext context) =>
                                            CustomAlert(
                                              dialogueWidget: tournamentPopup(
                                                data: tournament,
                                              ),
                                            ));
                                  },
                                  title: Text('${tournament.lists}'),
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
