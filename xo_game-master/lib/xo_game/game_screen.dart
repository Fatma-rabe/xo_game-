import 'package:flutter/material.dart';
import 'package:future_xo_game/xo_game/intro_screen.dart';
import 'package:future_xo_game/xo_game/xo_button.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  static const String routeName = "/gameScreen";

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> boardState = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  int counter = 0;

  /// 1
  void onClick(int index) {
    if (boardState[index].isNotEmpty) return;
    if (counter.isEven) {
      boardState[index] = arguments.firstPlayer;
    } else {
      boardState[index] = arguments.secondPlayer;
    }
    if (checkWinner("x")) {
      /// x is winner
      player1Score++;
      resetBoard();
    } else if (checkWinner("o")) {
      /// o is winner
      player2Score++;
      resetBoard();
    } else if (counter == 9) {
      /// draw
      resetBoard();
    }
    counter++;
    setState(() {});
  }

  void resetBoard() {
    boardState = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
    counter = 0;
  }

  bool checkWinner(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
      }
    }

    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    }
    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    }

    return false;
  }

  int player1Score = 0;
  int player2Score = 0;
  late GameScreenArguments arguments;

  @override
  Widget build(BuildContext context) {
    arguments =
        ModalRoute.of(context)?.settings.arguments as GameScreenArguments;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF00D2FF),
              Color(0xFF3A7BD5),
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20.0),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(44),
                        color: Colors.white),
                    child: Text(
                      "${arguments.firstPlayer} -> ${player1Score} VS ${arguments.secondPlayer} -> ${player2Score}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 28),
                    )),
                const Text(
                  "tic tac toe",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(44)),
                        width: double.infinity,
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  BoardButton(
                                    symbol: boardState[0],
                                    onClick: onClick,
                                    index: 0,
                                  ),
                                  BoardButton(
                                    symbol: boardState[1],
                                    onClick: onClick,
                                    index: 1,
                                  ),
                                  BoardButton(
                                    symbol: boardState[2],
                                    onClick: onClick,
                                    index: 2,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  BoardButton(
                                    symbol: boardState[3],
                                    onClick: onClick,
                                    index: 3,
                                  ),
                                  BoardButton(
                                    symbol: boardState[4],
                                    onClick: onClick,
                                    index: 4,
                                  ),
                                  BoardButton(
                                    symbol: boardState[5],
                                    onClick: onClick,
                                    index: 5,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  BoardButton(
                                    symbol: boardState[6],
                                    onClick: onClick,
                                    index: 6,
                                  ),
                                  BoardButton(
                                    symbol: boardState[7],
                                    onClick: onClick,
                                    index: 7,
                                  ),
                                  BoardButton(
                                    symbol: boardState[8],
                                    onClick: onClick,
                                    index: 8,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          VerticalDivider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                          VerticalDivider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Divider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
