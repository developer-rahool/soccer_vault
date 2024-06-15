import 'package:soccer_vault/const.dart';

class MatchModel {
  String? id;
  String? date;
  String? homeTeam;
  String? awayTeam;
  String? tournament;

  MatchModel({
    required this.id,
    required this.date,
    required this.homeTeam,
    required this.awayTeam,
    required this.tournament,
  });

  MatchModel.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    date = formatDate(json["date"]);
    homeTeam = json["home_team"];
    awayTeam = json["away_team"];
    tournament = json["tournament"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data["_id"] = id;
    data["date"] = formatDate(date!);
    data["home_team"] = homeTeam;
    data["away_team"] = awayTeam;
    data["tournament"] = tournament;
    return data;
  }
}
