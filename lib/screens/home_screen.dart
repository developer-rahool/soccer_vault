import 'package:flutter/material.dart';
import 'package:soccer_vault/const.dart';
import 'package:soccer_vault/screens/menu_pages/Tournament_page.dart';
import 'package:soccer_vault/screens/menu_pages/matches_page.dart';
import 'package:soccer_vault/screens/menu_pages/team_page.dart';
import 'package:soccer_vault/screens/menu_pages/tournament_by_countries_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  double cardHeight = 110;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlackColor,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset("assets/images/main_logo.png"),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        nextPage(context, MatchesPage());
                      },
                      child: SizedBox(
                        height: cardHeight,
                        child: Card(
                          color: Colors.white,
                          elevation: 1.5,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Matches",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: darkBlackColor),
                                    ),
                                    Text(
                                      "Matches records, states\nevents and Many",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: midBlackColor),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: Image.asset(
                                      "assets/icons/matchesIcon.png"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        nextPage(context, TeamsPage());
                      },
                      child: SizedBox(
                        height: cardHeight,
                        child: Card(
                          color: Colors.white,
                          elevation: 1.5,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Teams",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: darkBlackColor),
                                    ),
                                    Text(
                                      "Teams records, details\nevents and beyond",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: midBlackColor),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 60,
                                  width: 60,
                                  child:
                                      Image.asset("assets/icons/teamIcon.png"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        nextPage(context, TournamentPage());
                      },
                      child: SizedBox(
                        height: cardHeight,
                        child: Card(
                          color: Colors.white,
                          elevation: 1.5,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Tournaments",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: darkBlackColor),
                                    ),
                                    Text(
                                      "Tracks tournament records,\nstates events and more",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: midBlackColor),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: Image.asset(
                                      "assets/icons/tournamentIcon.png"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        nextPage(context, CountryTournamentPage());
                      },
                      child: SizedBox(
                        height: cardHeight,
                        child: Card(
                          color: Colors.white,
                          elevation: 1.5,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Match by Countries",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: darkBlackColor),
                                    ),
                                    Text(
                                      "Countres record by match",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: midBlackColor),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: Image.asset(
                                      "assets/icons/countriesListIcon.png"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
