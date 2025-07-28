import 'package:flutter/material.dart';
import 'package:future_xo_game/xo_game/game_screen.dart';
import 'package:future_xo_game/xo_game/intro_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        IntroScreen.routeName: (_) =>  IntroScreen(),
        GameScreen.routeName: (_) =>  GameScreen()
      },
      initialRoute: IntroScreen.routeName,
    );
  }
}
