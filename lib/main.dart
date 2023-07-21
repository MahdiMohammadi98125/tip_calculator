// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(const TipCalculator());
}

class TipCalculator extends StatelessWidget {
  const TipCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0XFF0A0E21),
        scaffoldBackgroundColor: const Color(0XFF0A0E21),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variables
  double billAmount = 0.0,
      tipPercentage = 5.0,
      people = 1,
      tipAmount = 0.0,
      totalAmount = 0.0;

  void calculate() {
    if (people == 1) {
      setState(() {
        tipAmount = billAmount * (tipPercentage / 100);
        totalAmount = billAmount + tipAmount;
      });
    } else {
      setState(() {
        tipAmount = billAmount * (tipPercentage / 100);
        tipAmount = tipAmount / people;
        double bellPerperson = billAmount / people;
        totalAmount = bellPerperson + tipAmount;
      });
    }
  }

  void tipDecrement() {
    setState(() {
      if (tipPercentage > 0.0) {
        tipPercentage--;
      }
    });
  }

  void tipIncrement() {
    setState(() {
      tipPercentage++;
    });
  }

  void peopleIncrement() {
    setState(() {
      people++;
    });
  }

  void peopleDecrement() {
    setState(() {
      if (people > 0) {
        people--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Simple Tip Calculator'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'images/tip.png',
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "tip calculator",
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                onChanged: (val) {
                  try {
                    billAmount = double.parse(val);
                  } catch (e) {
                    debugPrint("$e");
                  }
                },
                decoration: const InputDecoration(hintText: "bill amount"),
              ),
            ],
          ),
        ));
  }
}
