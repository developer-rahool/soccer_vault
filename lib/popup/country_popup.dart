import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Winning Matches: ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  Text(widget.data!.winningMatches.toString(),
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500)),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Played Matches: ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  Text(widget.data!.matchesPlayed.toString(),
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500)),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Tournament: ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  Expanded(
                    child: Text(widget.data!.tournament.toString(),
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis)),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
                text: "Copy",
                onPressed: () {
                  toast(context);
                  copyText(
                      "Winning Matches: ${widget.data!.winningMatches.toString()}, Matches Played: ${widget.data!.matchesPlayed.toString()}, Tournament: ${widget.data!.tournament.toString()} ");
                  Navigator.pop(context);
                }),
          )
        ],
      ),
    );
  }
}
