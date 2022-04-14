import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'BubbleSort.dart';
import 'MergeSort.dart';
import 'QuickSort.dart';

class BottomBar extends StatefulWidget {

  BottomBar({Key? key,required this.array,required this.generateArray, required this.isRunning,
    required this.viewController}) : super(key: key);

  List array;
  Function generateArray;
  bool isRunning;
  Function viewController;

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int speedAnimation = 1000;
  int sortingTracker = 0; //1=BubbleSort, 2=MergeSort, 3=QuickSort, 0=No selection
  @override
  Widget build(BuildContext context) {

    void speedChanger(int newSpeed){

      setState(() {
        speedAnimation = newSpeed;
      });
    }

    void sortingTrChanger(int selectedSort){

      setState(() {
        sortingTracker = selectedSort;
      });
    }

    return SizedBox(
      height: 200,
      width: 1000,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              const Text("Animation's slowness:",style: TextStyle(color: Colors.brown),),
              Slider(
                value: speedAnimation.toDouble(),
                min: 1000,
                max: 3000,
                divisions: 200,
                onChanged: !widget.isRunning
                    ? (newValue) {
                  speedChanger(newValue.toInt());
                } : null,
              ),
              const Text("Array's size:",style: TextStyle(color: Colors.brown),),
              Slider(
                value: widget.array.length.toDouble(),
                min: 2,
                max: 50,
                onChanged: !widget.isRunning
                    ? (newValue) {
                  widget.generateArray(newValue);
                } : null,
              ),
              TextButton(
                onPressed: !widget.isRunning ?() {
                  sortingTrChanger(1);
                  bubbleSort(widget.array, widget.viewController,speedAnimation);
                }: null,
                child: const Text("BubbleSort"),
              ),
              TextButton(
                  onPressed: !widget.isRunning ? (){
                    sortingTrChanger(2);
                    mergeSort(widget.array, 0, widget.array.length, widget.viewController,speedAnimation);
                  } : null,
                  child: const Text("MergeSort")
              ),
              TextButton(
                  onPressed: !widget.isRunning ? (){
                    sortingTrChanger(3);
                    quickSort(widget.array, 0, widget.array.length-1, widget.viewController,speedAnimation);
                  } : null,
                  child: const Text("QuickSort")
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text(sortingTracker == 1 ? "Classic sorting algorithm: O(n^2)" :
               sortingTracker == 2 ? "Divide et impera: O(n*log_2(n))" :
               sortingTracker == 3 ? "Pivot power : Average case O(n*log_2(n))." :
               "",
              style: const TextStyle(color: Colors.brown)),
        ],
      )
    );
  }
}


