import 'package:flutter/material.dart';
import 'package:soccer_vault/const.dart';
import '../models/tournament_by_countries_model.dart';

class CountriesListPopup extends StatefulWidget {
  CountryTournamentData? data;
  CountriesListPopup({super.key, this.data});

  @override
  State<CountriesListPopup> createState() => _CountriesListPopupState();
}

class _CountriesListPopupState extends State<CountriesListPopup> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Column(
        children: [
          ListTile(
            title: Text('${widget.data!.id}'),
            subtitle: Text(widget.data!.teams?.join(', ') ?? ''),
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
                      "${widget.data!.id}, ${widget.data!.teams?.join(', ') ?? ''}");
                  Navigator.pop(context);
                }),
          )
        ],
      ),
    );
  }
}
