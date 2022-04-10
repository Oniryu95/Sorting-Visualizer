import 'dart:html';
import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sorting/sorting/BubbleSort.dart';
import 'package:sorting/sorting/MergeSort.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
                    return Container(
                      margin: const EdgeInsets.all(1),
                      alignment: Alignment.topCenter,
                      color: (index == _indexFirstValue ||
                              index == _indexSecondValue)
                          ? Colors.red
                          : Colors.blue,
                      width: 20,
                      height: _array[index],
                    );
                  })),
            ),
            Slider(
              value: _array.length.toDouble(),
              min: 2,
              max: 50,
              onChanged: !isRunning
                  ? (newValue) {
                      setState(() {
                        _array = List<int>.generate(
                            newValue.toInt(), (index) => rng.nextInt(280) + 1);
                      });
                    }
                  : null,
            ),
            TextButton(
              onPressed: !isRunning ?() {
                _indexFirstValue = _indexSecondValue = 0;
                bubbleSort(_array, viewController);
              }: null,
              child: const Text("BubbleSort"),
            ),
            TextButton(
                onPressed: !isRunning ? (){
                  _indexFirstValue = _indexSecondValue = 0;
                  mergeSort(_array, 0, _array.length, viewController);
                } : null,
                child: const Text("MergeSort"))
          ],
        ));
  }
}
