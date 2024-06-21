import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soccer_vault/controller/matches_provider.dart';
import 'package:soccer_vault/popup/details_page.dart';

import '../../app_textfieldformfield.dart';
import '../../const.dart';
import '../../popup/matches_popup.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  MatchesProvider data = MatchesProvider();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    data = context.read<MatchesProvider>();
    _scrollController.addListener(_onScroll);
    load();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    data.searchByYear = "";
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent &&
        !data.isLoading) {
      data.fetchMatches();
    }
  }

  load() async {
    data.fetchMatches(isRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlackColor,
      appBar: AppBarWidget(title: "Matches By Year"),
      body: Consumer<MatchesProvider>(builder: (context, provider, child) {
        return Padding(
          padding: mainPadding,
          child: Column(
            children: [
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
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: provider.isLoading && provider.filteredMatches.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : provider.filteredMatches.isEmpty
                        ? const Center(
                            child: Text("No Records",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                          )
                        : NotificationListener<ScrollNotification>(
                            onNotification: (ScrollNotification scrollInfo) {
                              if (scrollInfo.metrics.pixels ==
                                      scrollInfo.metrics.maxScrollExtent &&
                                  !provider.isLoading) {
                                provider.fetchMatches();
                              }
                              return true;
                            },
                            child: ListView.builder(
                              controller: _scrollController,
                              itemCount: provider.filteredMatches.length +
                                  (provider.isLoading ? 1 : 0),
                              itemBuilder: (context, index) {
                                if (index == provider.filteredMatches.length) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                                final match = provider.filteredMatches[index];
                                return Card(
                                  elevation: 1,
                                  child: ListTile(
                                    onTap: () {
                                      nextPage(
                                          context,
                                          DetailPage(
                                            child: MatchesPopup(
                                              data: match,
                                            ),
                                            copyWidget: copyText(
                                                "Home Team: ${match.homeTeam}, Away Team: ${match.awayTeam}, Tournament: ${match.tournament}, Date: ${match.date}"),
                                          ));
                                    },
                                    title: Text(
                                        '${match.homeTeam} vs ${match.awayTeam}',
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600)),
                                    subtitle:
                                        Text('Tournament: ${match.tournament}'),
                                    trailing: Text('${match.date}'),
                                  ),
                                );
                              },
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
