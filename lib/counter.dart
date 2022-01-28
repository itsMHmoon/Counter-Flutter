// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'components/box.dart';
import 'utilities/color_manager.dart';

class MyCounter extends StatefulWidget {
  MyCounter({Key? key}) : super(key: key);

  @override
  _MyCounterState createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  int number = 0;
  int plus = 10;
  int minus = 5;

  List<Color> color = ColorManager.color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Changing Counter App'),
        centerTitle: true,
        backgroundColor: color[number % color.length],
      ),
      body: Container(
        color: color[number % color.length],
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "$number",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: color[plus % color.length],
                    ),
                    onPressed: () {
                      setState(() {
                        number += 5;
                        plus++;
                      });
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    child: Text(
                      '-',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: color[minus % color.length],
                    ),
                    onPressed: () {
                      if (number > 0) {
                        setState(() {
                          number -= 5;
                          minus++;
                        });
                      }
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (int i = 0; i < number; i++)
                      Box(
                        color: color[i % color.length],
                        text: '$i',
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
