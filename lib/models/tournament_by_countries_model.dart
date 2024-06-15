class CountryTournamentModel {
  bool? success;
  String? message;
  List<CountryTournamentData>? data;

  CountryTournamentModel({this.success, this.message, this.data});

  CountryTournamentModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CountryTournamentData>[];
      json['data'].forEach((v) {
        data!.add(CountryTournamentData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CountryTournamentData {
  String? id;
  List<String>? teams;

  CountryTournamentData({this.id, this.teams});

  CountryTournamentData.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    teams = json['teams'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['teams'] = teams;
    return data;
  }
}
