import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soccer_vault/controller/goal_scorer_provider.dart';
import 'package:soccer_vault/popup/details_page.dart';
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
      appBar: AppBarWidget(title: "Goal Score By Match", action: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) => const CustomAlert(
                          dialogueWidget: SearchGoalPopup(),
                        ));
              },
              icon: const Icon(
                Icons.search,
                size: 24.5,
                color: midBlackColor,
              )),
        )
      ]),
      body: Padding(
        padding: mainPadding,
        child:
            Consumer<GoalScorerProvider>(builder: (context, provider, child) {
          return Column(
            children: [
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
                                        nextPage(
                                            context,
                                            DetailPage(
                                                child: GoalScorerPopup(
                                                  data: goal,
                                                ),
                                                copyWidget: copyText(
                                                    "Home Team: ${goal.homeTeam}, Away Team: ${goal.awayTeam}, Scorer: ${goal.scorer}, Date: ${goal.date}, Minute: ${goal.minute},  Own Goal: ${goal.ownGoal}, Penalty: ${goal.penalty}")));
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
