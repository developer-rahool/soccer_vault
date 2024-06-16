import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_textfieldformfield.dart';
import '../../const.dart';
import '../../controller/tournament_country_provider.dart';
import '../../popup/countriesList_popup.dart';
import '../../popup/custom_alert.dart';

class CountryTournamentPage extends StatefulWidget {
  const CountryTournamentPage({super.key});

  @override
  State<CountryTournamentPage> createState() => _CountryTournamentPageState();
}

class _CountryTournamentPageState extends State<CountryTournamentPage> {
  TournamentByCountryProvider data = TournamentByCountryProvider();
  @override
  void initState() {
    data = context.read<TournamentByCountryProvider>();
    load();
    super.initState();
  }

  load() async {
    data.fetchCountriesByTournaments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlackColor,
      body: Consumer<TournamentByCountryProvider>(
          builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButtonWidget(),
                  Text(
                    "Country List",
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
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                hintText: "Search by tournament",
                // onChanged: (query) {
                //   provider.onChanged(query!);
                //   return;
                // },
              ),
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
                                  final tournament =
                                      provider.filteredTournaments[index];
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
                                                      CountriesListPopup(
                                                    data: tournament,
                                                  ),
                                                ));
                                      },
                                      title: Text('${tournament.id}',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600)),
                                      subtitle: Text(
                                          tournament.teams?.join(', ') ?? ''),
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
