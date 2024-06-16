import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soccer_vault/controller/team_provider.dart';
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
  TeamProvider data = TeamProvider();

  @override
  void initState() {
    data = context.read<TeamProvider>();
    load();
    super.initState();
  }

  load() async {
    data.fetchTeamStatistics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlackColor,
      body: Consumer<TeamProvider>(builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButtonWidget(),
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
                appController: provider.searchController,
                height: 40,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                maxLengthLine: 1,
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black45,
                  ),
                  onPressed: () {
                    provider.onPress();
                  },
                ),
                onEditingComplete: () {
                  provider.onPress();
                },
                hintText: "Search by team",
                // onChanged: (query) {
                //   provider.onChanged(query!);

                //   return;
                // },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Team: ',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                      Text(provider.currentTeam,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Total Matches: ',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                      Text("${provider.totalMatches}  ",
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis))
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: provider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : provider.filteredTeam.isEmpty
                        ? const Center(
                            child: Text("No Records",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                          )
                        : SingleChildScrollView(
                            child: SizedBox(
                              height: screenHeight(context) * 0.74,
                              width: double.infinity,
                              child: ListView.builder(
                                itemCount: provider.filteredTeam.length,
                                itemBuilder: (context, index) {
                                  var tournament = provider.filteredTeam[index];
                                  return Card(
                                    color: Colors.white,
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
                                      title: Text(
                                          'Winning Matches: ${tournament.winningMatches.toString()}\nPlayed Matches: ${tournament.matchesPlayed.toString()}'),
                                      subtitle: Text(
                                          tournament.tournament.toString(),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600)),
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
