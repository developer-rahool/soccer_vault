import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:soccer_vault/controller/Tournament_provider.dart';
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
  TournamentProvider data = TournamentProvider();

  @override
  void initState() {
    data = context.read<TournamentProvider>();
    load();
    super.initState();
  }

  load() async {
    await data.fetchTournaments();
  }

  void searchByAlphabet(String query, BuildContext context) {
    if (query.isEmpty) {
      data.filteredTournament = List.from(data.originalTournament);
    } else {
      data.filteredTournament = data.originalTournament.where((data) {
        String lowercaseTournament = data.lists.toString().toLowerCase();
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
      body: Consumer<TournamentProvider>(builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButtonWidget(),
                  Text(
                    "Tournament List",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: darkBlackColor),
                  ),
                  SizedBox()
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              AppTextFormField(
                appController: provider.searchController,
                height: 40,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                maxLengthLine: 1,
                prefixIcon: const Icon(
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
              Expanded(
                child: provider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        child: SizedBox(
                          height: screenHeight(context) * 0.76,
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: provider.filteredTournament.length,
                            itemBuilder: (context, index) {
                              final tournament =
                                  provider.filteredTournament[index];
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
              )
            ],
          ),
        );
      }),
    );
  }
}
