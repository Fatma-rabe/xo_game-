import 'package:flutter/material.dart';

class BoardButton extends StatelessWidget {
  BoardButton(
      {super.key,
      required this.symbol,
      required this.onClick,
      required this.index});

  Function onClick;
  int index;

  String symbol;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: () {
          onClick(index);
        },
        child: symbol.isEmpty
            ? Text("")
            : Image.asset("assets/images/$symbol.png"),
      ),
    );
  }
}
