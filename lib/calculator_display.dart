import 'package:flutter/material.dart';

class CalculatorDisplay extends StatelessWidget {
  final num;
  CalculatorDisplay(this.num);
  Widget build(BuildContext contx) {
    return Container(
      height: 300,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(2, 0, 2, 5),
      child: Card(
        elevation: 10,
        color: Colors.white38,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text(
            "$num",
            style: TextStyle(fontSize: 50),
          ),
          alignment: Alignment.bottomRight,
        ),
      ),
    );
  }
}
