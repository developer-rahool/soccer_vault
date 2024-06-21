import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soccer_vault/const.dart';
import 'package:soccer_vault/screens/home_screen.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({
    super.key,
  });

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 320,
                        width: 240,
                        child: Image.asset("assets/images/soccer_player1.png"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    "Your Ultimate Repository for All Things Soccer",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: midBlackColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: "Get Started",
                onPressed: () async {
                  final pres = await SharedPreferences.getInstance();
                  pres.setBool("onboarding", true);

                  if (!mounted) return;
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
