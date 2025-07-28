import 'package:flutter/material.dart';
import 'package:future_xo_game/xo_game/game_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  static const String routeName = "/introScreen";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF00D2FF),
                Color(0xFF3A7BD5),
              ]),
          image:
              DecorationImage(image: AssetImage("assets/images/xo_image.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "Pick who goes first?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, GameScreen.routeName,
                          arguments: GameScreenArguments(
                              firstPlayer: "x", secondPlayer: "o"));
                    },
                    child: SizedBox(
                      width: 100,
                      height:200,
                      child: Card(
                          margin:
                              const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32)),
                          child: Image.asset("assets/images/x.png"),),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, GameScreen.routeName,
                          arguments: GameScreenArguments(
                              firstPlayer: "o", secondPlayer: "x"));
                    },
                    child: SizedBox(
                      width: 90,
                      height:175,
                      child: Card(
                          margin:
                              const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32)),
                          child: Image.asset("assets/images/o.png")),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class GameScreenArguments {
  String firstPlayer;
  String secondPlayer;

  GameScreenArguments({required this.firstPlayer, required this.secondPlayer});
}
