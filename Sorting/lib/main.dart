import 'dart:html';
import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';

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

  List array = [5,10,17];
  bool isRunning = false;
  int indexFirstValue = 0;
  int indexSecondValue = 1;

  @override
  Widget build(BuildContext context) {
    var rng = Random();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(array.length, (indexs){
                return Container(
                  margin: const EdgeInsets.all(1),
                  alignment: Alignment.topCenter,
                  color: (indexs == indexFirstValue || indexs == indexSecondValue) ? Colors.red : Colors.blue,
                  width: 20,
                  height: array[indexs],
                );
              })
          ),
          Slider(
              value: array.length.toDouble(),
              min: 2,
              max: 50,
              onChanged: !isRunning ? (newValue){
                setState(() {
                  array = List<int>.generate(newValue.toInt(),(index) => rng.nextInt(250));
                });
              } : null,
          ),
          TextButton(onPressed: (){
            isRunning = true;
              Timer.periodic(Duration(milliseconds: 1000~/array.length), (timer) {
                if(indexFirstValue == array.length){
                  isRunning = false;
                  timer.cancel();
                  indexFirstValue = 0;
                  indexSecondValue = 1;
                }
                else{
                  if(indexSecondValue < array.length){
                    singleBubbleSort(array, indexFirstValue,indexSecondValue++);
                  }
                  else{
                    indexFirstValue++;
                    indexSecondValue = indexFirstValue+1;
                  }
                }
                setState(() {

                });
              });
          }, child: const Text("BubbleSort"))
        ],
      )
    );
  }
}

 void bubbleSort(List array){

  int temp;

  for(int i = 0; i < array.length;i++){

    for(int j = i+1; j <array.length;j++){

      if(array[j] < array[i]){

        temp = array[i];
        array[i] = array[j];
        array[j] = temp;
      }
    }
  }
 }

void singleBubbleSort(List array,int indexFirstValue, int indexSecondValue){

  int temp;

  if(array[indexSecondValue] < array[indexFirstValue]){

    temp = array[indexFirstValue];
    array[indexFirstValue] = array[indexSecondValue];
    array[indexSecondValue] = temp;
  }
}


