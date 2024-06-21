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
  int currentPage = 0; // Add this for pagination
  bool hasMoreData = true; // To keep track if more data is available

  fetchMatches({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        currentPage = 0;
        hasMoreData = true;
        originalMatches.clear();
        filteredMatches.clear();
      }

      if (!hasMoreData) return;

      isLoading = true;
      notifyListeners();

      var matches = await Services().getMatchesByYear(
        searchByYear == "" ? initialYear : searchByYear,
        currentPage * 20, // Pagination offset
        20, // Number of items to load per request
      );

      if (matches.isEmpty) {
        hasMoreData = false;
      } else {
        originalMatches.addAll(matches);
        filteredMatches = List.from(originalMatches);
        currentPage++;
      }

      isLoading = false;
      // searchByYear = "";
      searchController.clear();
    } catch (e) {
      isLoading = false;
      print(e);
    }
    notifyListeners();
  }

  onPress() {
    searchByYear = searchController.text;
    fetchMatches(isRefresh: true);
  }
}
