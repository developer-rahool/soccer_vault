import 'package:flutter/material.dart';

import '../httpService.dart';
import '../models/tournament_by_countries_model.dart';

class TournamentByCountryProvider with ChangeNotifier {
  final searchController = TextEditingController();
  List<CountryTournamentData> originalTournaments = [];
  List<CountryTournamentData> filteredTournaments = [];
  String searchByTournament = "";
  String initialTournament = "Friendly";
  bool isLoading = false;

  fetchCountriesByTournaments(String tournament) async {
    try {
      searchController.clear();
      isLoading = true;
      var tournamentModel =
          await Services().getCountriesByTournaments(tournament);
      // var tournamentModel = await Services().getCountriesByTournaments(
      //     searchByTournament == "" ? initialTournament : searchByTournament
      //     );
      originalTournaments = tournamentModel;
      filteredTournaments = List.from(originalTournaments);
      searchByTournament = "";

      isLoading = false;
    } catch (e) {
      isLoading = false;
      print(e);
    }
    notifyListeners();
  }

  // onPress() {
  //   searchByTournament = searchController.text;
  //   fetchCountriesByTournaments();
  //   notifyListeners();
  // }

  // onChanged(String query) {
  //   searchByTournament = query.toString();
  //   notifyListeners();
  // }
}
