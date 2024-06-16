import 'package:soccer_vault/const.dart';

class GoalScorerModel {
  String? id;
  String? date;
  String? homeTeam;
  String? awayTeam;
  String? team;
  String? scorer;
  int? minute;
  bool? ownGoal;
  bool? penalty;

  GoalScorerModel({
    this.id,
    this.date,
    this.homeTeam,
    this.awayTeam,
    this.team,
    this.scorer,
    this.minute,
    this.ownGoal,
    this.penalty,
  });

  GoalScorerModel.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    date = formatDate(json["date"]);
    homeTeam = json["home_team"];
    awayTeam = json["away_team"];
    team = json["team"];
    scorer = json["scorer"];
    minute = json["minute"];
    ownGoal = json["own_goal"];
    penalty = json["penalty"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data["_id"] = id;
    data["date"] = formatDate(date!);
    data["home_team"] = homeTeam;
    data["away_team"] = awayTeam;
    data["tournament"] = team;
    data["minute"] = minute;
    data["scorer"] = scorer;
    data["own_goal"] = ownGoal;
    data["penalty"] = penalty;
    return data;
  }
}
