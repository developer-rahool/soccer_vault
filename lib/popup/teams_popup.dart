import 'package:flutter/material.dart';
import 'package:soccer_vault/const.dart';
import '../models/teamsModel.dart';

class TeamsPopup extends StatefulWidget {
  Tournament? data;
  TeamsPopup({super.key, this.data});

  @override
  State<TeamsPopup> createState() => _TeamsPopupState();
}

class _TeamsPopupState extends State<TeamsPopup> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Column(
        children: [
          ListTile(
            title: Text(widget.data!.tournament.toString()),
            subtitle: Text(
                'Matches Played: ${widget.data!.matchesPlayed.toString()}\nWinning Matches: ${widget.data!.winningMatches.toString()}'),
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
                      "${widget.data!.tournament.toString()}, Matches Played: ${widget.data!.matchesPlayed.toString()}, Winning Matches: ${widget.data!.winningMatches.toString()}");
                  Navigator.pop(context);
                }),
          )
        ],
      ),
    );
  }
}
