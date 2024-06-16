import 'package:flutter/material.dart';
import 'package:soccer_vault/const.dart';
import 'package:soccer_vault/models/tournamentModel.dart';

class tournamentPopup extends StatefulWidget {
  ListTournamentModel? data;
  tournamentPopup({super.key, this.data});

  @override
  State<tournamentPopup> createState() => _tournamentPopupState();
}

class _tournamentPopupState extends State<tournamentPopup> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        children: [
          ListTile(
            title: Text(
              '${widget.data!.lists}',
              textAlign: TextAlign.start,
            ),
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
                  copyText("${widget.data!.lists}");
                  Navigator.pop(context);
                }),
          )
        ],
      ),
    );
  }
}
