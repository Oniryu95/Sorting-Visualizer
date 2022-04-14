import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sorting/sorting/BottomBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(title: 'Sorting Visualizzer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List _array = [5, 10, 17];
  int _indexFirstValue = 0;
  int _indexSecondValue = 0;
  bool isRunning = false;
  int speedAnimation = 1000;

  @override
  Widget build(BuildContext context) {
    var rng = Random();

    void viewController(int i, int j, List array, bool newRunning) {
      setState(() {
        _indexFirstValue = i;
        _indexSecondValue = j;
        _array = array;
        isRunning = newRunning;
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
            SizedBox(
              height: 300,
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
            BottomBar(
              array: _array,
              isRunning: isRunning,
              generateArray: generateArray,
              viewController: viewController,
            ),
          ],
        ));
  }
}
