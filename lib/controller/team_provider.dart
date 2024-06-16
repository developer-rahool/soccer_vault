import 'package:flutter/material.dart';
import 'package:soccer_vault/httpService.dart';

import '../models/teamsModel.dart';

class TeamProvider with ChangeNotifier {
  final searchController = TextEditingController();
  //List? teams;
  // final RootResponse teams = fetchMockTeams();
  List<Tournament>? originalTeam;
  List<Tournament> filteredTeam = [];
  TeamData teamData = TeamData();
  String initialTeam = "brazil";
  String searchByTeam = "";
  String totalMatches = "";
  String currentTeam = "";
  bool isLoading = true;

  fetchTeamStatistics() async {
    try {
      isLoading = true;
      teamData = await Services()
          .getTeamStatistics(searchByTeam == "" ? initialTeam : searchByTeam);

      originalTeam = teamData.tournaments;
      filteredTeam = List.from(originalTeam!);
      totalMatches = teamData.totalMatches.toString();
      currentTeam = teamData.team.toString();

      isLoading = false;
      searchByTeam = "";
      searchController.clear();
    } catch (e) {
      isLoading = false;
      print(e);
    }
    notifyListeners();
  }

  onPress() {
    searchByTeam = searchController.text;
    fetchTeamStatistics();
    notifyListeners();
  }

  // onChanged(String query) {
  //   searchByTeam = query.toString();
  //   notifyListeners();
  // }
}
