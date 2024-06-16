import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:soccer_vault/models/goal_scorer_model.dart';
import 'package:soccer_vault/models/teamsModel.dart';

import 'models/matchesModel.dart';
import 'models/tournamentModel.dart';
import 'models/tournament_by_countries_model.dart';

class Services {
  final String _baseUrl =
      'https://International-Football-Results-API.proxy-production.allthingsdev.co/api/v1/soccer/';

  var headers = {
    'x-api-key':
        'aMFouLkMjcxGopFBPmzjWGMKQCkVKPDMsghukTvPHaPWzsqALZZFfGRtpBgvEKVVLGDJjDBavveHcoVKhuqjovsRWhkgGEQiyRmX',
    'x-app-version': '1.0.0',
    'x-apihub-key': 'rh5syBTEajhGpmfn5QB6XaiXogrkfgPOhBi8PfjcJjtbdN1QFM',
    'x-apihub-host': 'International-Football-Results-API.allthingsdev.co'
  };
  Future getMatchesByYear(String? year) async {
    var url = Uri.parse('${_baseUrl}matches?year=$year&skip=0&limit=10');
    try {
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        return responseData['data']
            .map((json) => MatchModel.fromJson(json))
            .toList();
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future getTeamStatistics(String? team) async {
    var url = Uri.parse('${_baseUrl}statistics-by-team?team=$team');
    try {
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        return TeamData.fromJson(responseData['data']!);
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future getTournaments() async {
    var url = Uri.parse('${_baseUrl}tournaments?skip=0&limit=100');
    try {
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        List<dynamic> data = responseData['data'];
        return data
            .map<ListTournamentModel>(
                (json) => ListTournamentModel.fromJson(json))
            .toList();
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future getCountriesByTournaments(String tournament) async {
    var url = Uri.parse(
        '${_baseUrl}list-countries-by-tournaments?tournament=$tournament&skip=0&limit=10');
    try {
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        print(responseData);
        List<dynamic> data = responseData['data'];
        return data
            .map((json) => CountryTournamentData.fromJson(json))
            .toList();
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future getGoalScores(String? date, String? homeTeam, String? awayTeam) async {
    var url = Uri.parse('${_baseUrl}scorer');
    try {
      final response = await http.post(url, headers: headers, body: {
        "date": date ?? "1916-07-02",
        "awayTeam": awayTeam ?? "Uruguay",
        "homeTeam": homeTeam ?? "Chile"
      });

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        return responseData['data']
            .map((json) => GoalScorerModel.fromJson(json))
            .toList();
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
