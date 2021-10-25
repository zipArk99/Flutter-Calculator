import 'package:calculator/calculator_display.dart';
import 'package:calculator/calculator_pad.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  Widget build(BuildContext conx) {
    return MaterialApp(
      title: "Calculator",
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  int? operationId;
  String num1 = "";
  int parseNum = 0;
  int totalNum = 0;
  Container operationButton({IconData? iconImage, int? operId}) {
    print(operId);

    return Container(
      child: IconButton(
        onPressed: () {
          if (operId as int == 7) {
            operations(id: operationId, equal: operId);
          } else {
            operations(id: operId);
          }
        },
        icon: Icon(
          iconImage,
          size: 30,
        ),
      ),
    );
  }

  List<Map<String, int>> get keys {
    return List.generate(10, (index) {
      return {"Number": index};
    });
  }

  Container button(String name, int buttonId) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.all(5),
      child: TextButton(
          onPressed: () {
            operations(id: buttonId);
          },
          child: Text(
            "AC",
            style: TextStyle(fontSize: 30, color: Colors.black),
          )),
    );
  }

  void operations({int? id, int? equal}) {
    setState(() {
      parseNum = int.parse(num1);
      switch (id) {
        case 1:
          totalNum += parseNum;
          operationId = 1;
          break;

        case 2:
          totalNum == 0 ? totalNum += parseNum : totalNum -= parseNum;
          operationId = 2;
          break;

        case 3:
          if (totalNum == 0) {
            totalNum = 1;
          }
          totalNum *= parseNum;
          operationId = 3;
          break;

        case 4:
          if (totalNum == 0) {
            totalNum += parseNum;
          } else {
            totalNum = totalNum ~/ parseNum;
          }
          operationId = 4;
          break;

        case 5:
          num1 = num1.substring(0, num1.length - 1);
          break;

        case 6:
          totalNum = 0;
          break;

        default:
          print("Please select from upper keys");
      }

      if (equal == 7) {
        print("Equal to called");
        num1 = totalNum.toString();
        totalNum = 0;
      }
      if (id != 5) {
        if (equal != 7) {
          print("equal::::$equal");
          print("id:::$id");
          print("operation Called");
          num1 = "";
        }
      }
    });
  }

  void calculate(int x) {
    setState(() {
      num1 += x.toString();
    });
    print(num1);
  }

  void addDot() {
    setState(() {
      num1 += ".";
    });
  }

  Widget build(BuildContext contx) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        children: [
          CalculatorDisplay(num1),
          CalculatorPad(keys, operationButton, button, calculate, addDot),
        ],
      ),
    );
  }
}
