import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                  const Text('Home Team: ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  Expanded(
                    child: Text(widget.data!.homeTeam.toString(),
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis)),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Away Team: ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  Expanded(
                    child: Text(widget.data!.awayTeam.toString(),
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis)),
                  )
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
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Date: ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  Text(widget.data!.date.toString(),
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500)),
                ],
              )
            ],
          ),
          // ListTile(
          //   title: Text(' Home Team: ${widget.data!.homeTeam} vs ${widget.data!.awayTeam}'),
          //   subtitle: Text('${widget.data!.tournament}'),
          //   trailing: Text('${widget.data!.date}'),
          // ),
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
                      "Home Team: ${widget.data!.homeTeam}, Away Team: ${widget.data!.awayTeam}, Tournament: ${widget.data!.tournament}, Date: ${widget.data!.date}");
                  Navigator.pop(context);
                }),
          )
        ],
      ),
    );
  }
}
