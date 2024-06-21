import 'package:flutter/material.dart';
import 'package:soccer_vault/const.dart';
import 'package:soccer_vault/screens/menu_pages/Tournament_page.dart';
import 'package:soccer_vault/screens/menu_pages/countries_list_page.dart';
import 'package:soccer_vault/screens/menu_pages/goal_score_by_matches.dart';
import 'package:soccer_vault/screens/menu_pages/matches_page.dart';
import 'package:soccer_vault/screens/menu_pages/country_matches_records.dart';
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
                        nextPage(context, CountriesListPage());
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
                                      "Country Records",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: darkBlackColor),
                                    ),
                                    Text(
                                      "Rrecords, details events\nand beyond",
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
                        nextPage(context, GoalScorePage());
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
                                      "Goal Scorer",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: darkBlackColor),
                                    ),
                                    Text(
                                      "Goal records, states\nevents and more",
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
                                      "assets/icons/goalScorer.png"),
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
                    // GestureDetector(
                    //   onTap: () {
                    //     nextPage(context, CountryTournamentPage());
                    //   },
                    //   child: SizedBox(
                    //     height: cardHeight,
                    //     child: Card(
                    //       color: Colors.white,
                    //       elevation: 1.5,
                    //       child: Padding(
                    //         padding:
                    //             const EdgeInsets.symmetric(horizontal: 20.0),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             const Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               children: [
                    //                 Text(
                    //                   "Match by Countries",
                    //                   style: TextStyle(
                    //                       fontSize: 18,
                    //                       fontWeight: FontWeight.w700,
                    //                       color: darkBlackColor),
                    //                 ),
                    //                 Text(
                    //                   "Countries record by match",
                    //                   style: TextStyle(
                    //                       fontSize: 14,
                    //                       fontWeight: FontWeight.w700,
                    //                       color: midBlackColor),
                    //                 )
                    //               ],
                    //             ),
                    //             SizedBox(
                    //               height: 60,
                    //               width: 60,
                    //               child: Image.asset(
                    //                   "assets/icons/countriesListIcon.png"),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
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
