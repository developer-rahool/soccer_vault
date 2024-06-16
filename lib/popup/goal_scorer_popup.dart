import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:soccer_vault/const.dart';
import 'package:soccer_vault/models/goal_scorer_model.dart';

class GoalScorerPopup extends StatefulWidget {
  GoalScorerModel? data;
  GoalScorerPopup({super.key, this.data});

  @override
  State<GoalScorerPopup> createState() => _GoalScorerPopupState();
}

class _GoalScorerPopupState extends State<GoalScorerPopup> {
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
                  const Text('Scorer: ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  Expanded(
                    child: Text(widget.data!.scorer.toString(),
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
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Minute: ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  Expanded(
                    child: Text(widget.data!.minute.toString(),
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
                  const Text('Own Goal: ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  Text(widget.data!.ownGoal.toString(),
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
                  const Text('Penalty: ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  Text(widget.data!.penalty.toString(),
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500)),
                ],
              )
            ],
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
                      "Home Team: ${widget.data!.homeTeam}, Away Team: ${widget.data!.awayTeam}, Scorer: ${widget.data!.scorer}, Date: ${widget.data!.date}, Minute: ${widget.data!.minute},  Own Goal: ${widget.data!.ownGoal}, Penalty: ${widget.data!.penalty}");
                  Navigator.pop(context);
                }),
          )
        ],
      ),
    );
  }
}
