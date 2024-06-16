import 'package:flutter/material.dart';

import '../httpService.dart';
import '../models/goal_scorer_model.dart';

class GoalScorerProvider with ChangeNotifier {
  final dateController = TextEditingController();
  final homeController = TextEditingController();
  final awayController = TextEditingController();
  List<GoalScorerModel> originalGoalScore = [];
  List<GoalScorerModel> filteredGoalScore = [];
  String? searchDate;
  String? searchHome;
  String? searchAway;
  bool isLoading = false;

  fetchGoalScores() async {
    try {
      isLoading = true;
      originalGoalScore.clear();
      filteredGoalScore.clear();
      final matches =
          await Services().getGoalScores(searchDate, searchHome, searchAway);
      for (var data in matches) {
        originalGoalScore.add(data);
      }
      filteredGoalScore = List.from(originalGoalScore);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      print(e);
      notifyListeners();
    }
  }
}
