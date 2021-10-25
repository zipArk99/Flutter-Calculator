import 'package:flutter/material.dart';

class CalculatorPad extends StatelessWidget {
  final List<Map<String, int>> keys;
  final Function operationButton;
  final Function button;
  final Function calculate;
  final Function addDot;

  CalculatorPad(this.keys, this.operationButton, this.button, this.calculate,
      this.addDot);

  Widget build(BuildContext contx) {
    var size = MediaQuery.of(contx).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 360) / 2.5;
    final double itemWidth = size.width / 2;
    return Row(
      children: [
        Flexible(
          fit: FlexFit.tight,
          flex: 6,
          child: Container(
            height: 450,
            margin: EdgeInsets.symmetric(horizontal: 3),
            child: GridView.count(
              childAspectRatio: itemHeight / itemWidth,
              crossAxisCount: 3,
              children: [
                button("AC", 6),
                ...keys.map(
                  (key) {
                    return Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: TextButton(
                            onPressed: () {
                              calculate(key['Number'] as int);
                            },
                            child: Text(
                              "${key['Number']}",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black),
                            )),
                      ),
                    );
                  },
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: TextButton(
                      onPressed: () {
                        addDot();
                      },
                      child: Text(
                        ".",
                        style: TextStyle(fontSize: 50, color: Colors.black),
                      )),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 3,
          child: Container(
              height: 450,
              margin: EdgeInsets.symmetric(horizontal: 3),
              child: Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      height: 450,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          operationButton(iconImage: Icons.add, operId: 1),
                          operationButton(iconImage: Icons.minimize, operId: 2),
                          operationButton(
                              iconImage: Icons.cancel_outlined, operId: 3),
                          operationButton(
                              iconImage: Icons.sim_card_alert_sharp, operId: 4),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                        height: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            operationButton(
                                iconImage: Icons.backspace_outlined, operId: 5),
                            operationButton(
                                iconImage: Icons.double_arrow_sharp, operId: 7),
                          ],
                        )),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
