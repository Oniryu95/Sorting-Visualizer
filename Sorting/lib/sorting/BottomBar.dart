import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BubbleSort.dart';
import 'MergeSort.dart';
import 'QuickSort.dart';

class BottomBar extends StatelessWidget {
  BottomBar({Key? key,required this.array,required this.generateArray, required this.isRunning,
  required this.viewController}) : super(key: key);
  List array;
  Function generateArray;
  bool isRunning;
  Function viewController;

  @override
  Widget build(BuildContext context) {
    var rng = Random();

    return SizedBox(
      height: 50,
      width: 700,
      child: Row(
          children: <Widget>[
            const Text("Array's size:",style: TextStyle(color: Colors.brown),),
            Slider(
              value: array.length.toDouble(),
              min: 2,
              max: 50,
              onChanged: !isRunning
                  ? (newValue) {
                generateArray(newValue);
              } : null,
            ),
            TextButton(
              onPressed: !isRunning ?() {
                bubbleSort(array, viewController);
              }: null,
              child: const Text("BubbleSort"),
            ),
            TextButton(
                onPressed: !isRunning ? (){
                  mergeSort(array, 0, array.length, viewController);
                } : null,
                child: const Text("MergeSort")
            ),
            TextButton(
                onPressed: !isRunning ? (){
                  quickSort(array, 0, array.length-1, viewController);
                } : null,
                child: const Text("QuickSort")
            ),
          ],
        ),
      );
  }
}
