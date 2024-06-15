class TeamData {
  int? totalMatches;
  List<Tournament>? tournaments;

  TeamData({this.totalMatches, this.tournaments});

  TeamData.fromJson(Map<String, dynamic> json) {
    totalMatches = json['totalMatches'];
    if (json['tournaments'] != null) {
      tournaments = <Tournament>[];
      json['tournaments'].forEach((v) {
        tournaments!.add(Tournament.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalMatches'] = totalMatches;
    if (tournaments != null) {
      data['tournaments'] = tournaments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tournament {
  String? tournament;
  int? matchesPlayed;
  int? winningMatches;

  Tournament({this.tournament, this.matchesPlayed, this.winningMatches});

  Tournament.fromJson(Map<String, dynamic> json) {
    tournament = json['tournament'];
    matchesPlayed = json['matchesPlayed'];
    winningMatches = json['winningMatches'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tournament'] = tournament;
    data['matchesPlayed'] = matchesPlayed;
    data['winningMatches'] = winningMatches;
    return data;
  }
}
