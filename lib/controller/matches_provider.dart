import 'package:flutter/material.dart';

import '../httpService.dart';
import '../models/matchesModel.dart';

class MatchesProvider with ChangeNotifier {
  final searchController = TextEditingController();
  List<MatchModel> originalMatches = [];
  List<MatchModel> filteredMatches = [];
  String initialYear = "2024";
  String searchByYear = "";
  bool isLoading = false;

  fetchMatches() async {
    try {
      isLoading = true;
      originalMatches.clear();
      filteredMatches.clear();
      var matches = await Services()
          .getMatchesByYear(searchByYear == "" ? initialYear : searchByYear);
      for (var data in matches) {
        originalMatches.add(data);
      }

      filteredMatches = List.from(originalMatches);

      isLoading = false;
      searchByYear = "";
      searchController.clear();
    } catch (e) {
      isLoading = false;

      print(e);
    }
    notifyListeners();
  }

  onPress() {
    searchByYear = searchController.text;
    fetchMatches();
    notifyListeners();
  }
}
