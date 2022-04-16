import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sorting/widget/BottomBar.dart';

class NormalBody extends StatefulWidget {
  const NormalBody({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<NormalBody> createState() => _NormalBodyState();
}

class _NormalBodyState extends State<NormalBody> {

  List _array = [5, 10, 17];
  int _indexFirstValue = 0;
  int _indexSecondValue = 0;
  bool isRunning = false;
  int speedAnimation = 1000;
  int passCounter = 0;

  @override
  Widget build(BuildContext context) {
    var rng = Random();

    void viewController(int i, int j, List array, bool newRunning) {
      setState(() {
        _indexFirstValue = i;
        _indexSecondValue = j;
        _array = array;
        isRunning = newRunning;
        passCounter++;
      });
    }

    void passChanger(int newPassVal){
      setState((){passCounter = newPassVal;
      });
    }

    void generateArray(double value){

      setState(() {
        _array = List<int>.generate(
            value.toInt(), (index) => rng.nextInt(280) + 1);
      });
    }

    void speedChanger(int newSpeed){

      setState(() {
        speedAnimation = newSpeed;
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(_array.length, (index) {
                    return AnimatedContainer(
                      margin: const EdgeInsets.all(1),
                      alignment: Alignment.topCenter,
                      color: (index == _indexFirstValue ||
                          index == _indexSecondValue)
                          ? Colors.brown
                          : Colors.teal,
                      width: 20,
                      height: _array[index],
                      duration: const Duration(milliseconds: 200),
                    );
                  })),
            ),
            Expanded(
                flex: 3,
                child: BottomBar(
                  array: _array,
                  isRunning: isRunning,
                  generateArray: generateArray,
                  viewController: viewController,
                  passCounter: passCounter,
                  passChanger: passChanger,
                )
            ),
          ],
        ));
  }
}

class TinyBody extends StatefulWidget {
  const TinyBody({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TinyBody> createState() => _TinyBodyState();
}

class _TinyBodyState extends State<TinyBody> {

  List _array = [5, 10, 17];
  int _indexFirstValue = 0;
  int _indexSecondValue = 0;
  bool isRunning = false;
  int speedAnimation = 1000;
  int passCounter = 0;

  @override
  Widget build(BuildContext context) {
    var rng = Random();

    void viewController(int i, int j, List array, bool newRunning) {
      setState(() {
        _indexFirstValue = i;
        _indexSecondValue = j;
        _array = array;
        isRunning = newRunning;
        passCounter++;
      });
    }

    void passChanger(int newPassVal){
      setState((){passCounter = newPassVal;
      });
    }

    void generateArray(double value){

      setState(() {
        _array = List<int>.generate(
            value.toInt(), (index) => rng.nextInt(280) + 1);
      });
    }

    void speedChanger(int newSpeed){

      setState(() {
        speedAnimation = newSpeed;
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(_array.length, (index) {
                    return AnimatedContainer(
                      margin: const EdgeInsets.all(1),
                      alignment: Alignment.topCenter,
                      color: (index == _indexFirstValue ||
                          index == _indexSecondValue)
                          ? Colors.brown
                          : Colors.teal,
                      width: 10,
                      height: _array[index],
                      duration: const Duration(milliseconds: 200),
                    );
                  })),
            ),
            Expanded(
                flex: 2,
                child: BottomBar(
                  array: _array,
                  isRunning: isRunning,
                  generateArray: generateArray,
                  viewController: viewController,
                  passCounter: passCounter,
                  passChanger: passChanger,
                )
            ),
          ],
        ));
  }
}