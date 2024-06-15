import 'package:flutter/material.dart';
import 'package:soccer_vault/const.dart';

import '../models/matchesModel.dart';

class MatchesPopup extends StatefulWidget {
  MatchModel? data;
  MatchesPopup({super.key, this.data});

  @override
  State<MatchesPopup> createState() => _MatchesPopupState();
}

class _MatchesPopupState extends State<MatchesPopup> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Column(
        children: [
          ListTile(
            title: Text('${widget.data!.homeTeam} vs ${widget.data!.awayTeam}'),
            subtitle: Text('${widget.data!.tournament}'),
            trailing: Text('${widget.data!.date}'),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            width: double.infinity,
            child: Custom_Button(
                text: "Copy",
                onPressed: () {
                  toast(context);
                  copyText(
                      "${widget.data!.homeTeam} vs ${widget.data!.awayTeam}, ${widget.data!.tournament}, ${widget.data!.date}");
                  Navigator.pop(context);
                }),
          )
        ],
      ),
    );
  }
}
