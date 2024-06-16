import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soccer_vault/controller/goal_scorer_provider.dart';
import '../../const.dart';
import '../../popup/custom_alert.dart';
import '../../popup/goal_scorer_popup.dart';
import '../../popup/searchGaols_popup.dart';

class GoalScorePage extends StatefulWidget {
  const GoalScorePage({super.key});

  @override
  State<GoalScorePage> createState() => _GoalScorePageState();
}

class _GoalScorePageState extends State<GoalScorePage> {
  GoalScorerProvider data = GoalScorerProvider();

  @override
  void initState() {
    data = context.read<GoalScorerProvider>();
    load();
    super.initState();
  }

  load() async {
    data.fetchGoalScores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlackColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
        child:
            Consumer<GoalScorerProvider>(builder: (context, provider, child) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackButtonWidget(),
                  const Text(
                    "Goal Score By Match",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: darkBlackColor),
                  ),
                  //SizedBox()
                  IconButton(
                      onPressed: () {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) =>
                                const CustomAlert(
                                  dialogueWidget: SearchGoalPopup(),
                                ));
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 24.5,
                        color: midBlackColor,
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: provider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : provider.filteredGoalScore.isEmpty
                        ? const Center(
                            child: Text("No Records",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                          )
                        : SingleChildScrollView(
                            child: SizedBox(
                              height: screenHeight(context) * 0.81,
                              width: double.infinity,
                              child: ListView.builder(
                                itemCount: provider.filteredGoalScore.length,
                                itemBuilder: (context, index) {
                                  final goal =
                                      provider.filteredGoalScore[index];
                                  return Card(
                                    elevation: 1,
                                    child: ListTile(
                                      onTap: () {
                                        showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (BuildContext context) =>
                                                CustomAlert(
                                                  dialogueWidget:
                                                      GoalScorerPopup(
                                                    data: goal,
                                                  ),
                                                ));
                                      },
                                      title: Text(
                                          '${goal.homeTeam} vs ${goal.awayTeam}',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600)),
                                      subtitle: Text(
                                          'Scorer: ${goal.scorer}, Minute: ${goal.minute}'),
                                      trailing: Text('${goal.date}'),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
              )
            ],
          );
        }),
      ),
    );
  }
}
