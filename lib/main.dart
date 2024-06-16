import 'package:flutter/material.dart';
import 'package:soccer_vault/controller/Tournament_provider.dart';
import 'package:soccer_vault/controller/goal_scorer_provider.dart';
import 'package:soccer_vault/controller/matches_provider.dart';
import 'package:soccer_vault/controller/team_provider.dart';
import 'controller/tournament_country_provider.dart';
import 'screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MatchesProvider()),
        ChangeNotifierProvider(create: (context) => TeamProvider()),
        ChangeNotifierProvider(create: (context) => TournamentProvider()),
        ChangeNotifierProvider(create: (context) => GoalScorerProvider()),
        ChangeNotifierProvider(
            create: (context) => TournamentByCountryProvider())
      ],
      child: MaterialApp(
        title: 'Soccer Vault',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
