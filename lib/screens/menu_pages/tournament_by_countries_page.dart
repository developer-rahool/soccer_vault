import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../const.dart';
import '../../controller/tournament_country_provider.dart';

class CountryTournamentPage extends StatefulWidget {
  String? tour;
  CountryTournamentPage({super.key, this.tour});

  @override
  State<CountryTournamentPage> createState() => _CountryTournamentPageState();
}

class _CountryTournamentPageState extends State<CountryTournamentPage> {
  TournamentByCountryProvider data = TournamentByCountryProvider();
  String tournament = "";
  List<String> teams = [];
  @override
  void initState() {
    data = context.read<TournamentByCountryProvider>();
    load();
    super.initState();
  }

  load() async {
    data.fetchCountriesByTournaments(widget.tour!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlackColor,
      appBar: AppBarWidget(title: "Participations"),
      body: Consumer<TournamentByCountryProvider>(
          builder: (context, provider, child) {
        return Padding(
          padding: mainPadding,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: provider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : provider.filteredTournaments.isEmpty
                        ? const Center(
                            child: Text("No Records",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                          )
                        : SingleChildScrollView(
                            child: SizedBox(
                              height: screenHeight(context) * 0.78,
                              width: double.infinity,
                              child: ListView.builder(
                                itemCount: provider.filteredTournaments.length,
                                itemBuilder: (context, index) {
                                  tournament =
                                      provider.filteredTournaments[index].id!;
                                  teams = provider
                                      .filteredTournaments[index].teams!;
                                  return Card(
                                    elevation: 1,
                                    child: ListTile(
                                      // onTap: () {
                                      //   nextPage(
                                      //       context,
                                      //       DetailPage(
                                      //         child: CountriesListPopup(
                                      //           data: tournament,
                                      //         ),
                                      //         copyWidget: copyText(
                                      //             "Tournament: ${tournament.id}, Countries: ${tournament.teams?.join(', ') ?? ''}"),
                                      //       ));
                                      // },
                                      title: Text('${tournament}',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600)),
                                      subtitle: Text(teams.join(', ')),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                      text: "Copy",
                      onPressed: () {
                        toast(context);
                        copyText(
                            "Tournament: ${tournament}, Countries: ${teams.join(', ')}");
                        Navigator.pop(context);
                      }),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
