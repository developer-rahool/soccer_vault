class ListTournamentModel {
  String? lists;
  ListTournamentModel({this.lists});

  ListTournamentModel.fromJson(String json) {
    lists = json;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["data"] = lists;
    return data;
  }
}
