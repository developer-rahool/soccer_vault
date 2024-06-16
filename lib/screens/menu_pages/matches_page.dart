import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soccer_vault/controller/matches_provider.dart';

import '../../app_textfieldformfield.dart';
import '../../const.dart';
import '../../popup/custom_alert.dart';
import '../../popup/matches_popup.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  MatchesProvider data = MatchesProvider();

  @override
  void initState() {
    data = context.read<MatchesProvider>();
    load();
    super.initState();
  }

  load() async {
    data.fetchMatches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlackColor,
      body: Consumer<MatchesProvider>(builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButtonWidget(),
                  Text(
                    "Matches By Year",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: darkBlackColor),
                  ),
                  SizedBox()
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              AppTextFormField(
                appController: provider.searchController,
                height: 40,
                keyboardType: TextInputType.number,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                maxLengthLine: 1,
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black45,
                  ),
                  onPressed: () {
                    provider.onPress();
                  },
                ),
                onEditingComplete: () {
                  provider.onPress();
                },
                hintText: "Search by year",
                // onChanged: (query) {
                //   provider.onChanged(query!);
                //   return;
                // },
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: provider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : provider.filteredMatches.isEmpty
                        ? const Center(
                            child: Text("No Records",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                          )
                        : SingleChildScrollView(
                            child: SizedBox(
                              height: screenHeight(context) * 0.77,
                              width: double.infinity,
                              child: ListView.builder(
                                itemCount: provider.filteredMatches.length,
                                itemBuilder: (context, index) {
                                  final match = provider.filteredMatches[index];
                                  return Card(
                                    elevation: 1,
                                    child: ListTile(
                                      onTap: () {
                                        showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (BuildContext context) =>
                                                CustomAlert(
                                                  dialogueWidget: MatchesPopup(
                                                    data: match,
                                                  ),
                                                ));
                                      },
                                      title: Text(
                                          '${match.homeTeam} vs ${match.awayTeam}',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600)),
                                      subtitle: Text(
                                          'Tournament: ${match.tournament}'),
                                      trailing: Text('${match.date}'),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
              )
            ],
          ),
        );
      }),
    );
  }
}
