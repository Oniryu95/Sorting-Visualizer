import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../sorting/BubbleSort.dart';
import '../sorting/MergeSort.dart';
import '../sorting/QuickSort.dart';

class BottomBar extends StatefulWidget {

  BottomBar({Key? key,required this.array,required this.generateArray, required this.isRunning,
    required this.viewController, required this.passCounter, required this.passChanger}) : super(key: key);

  Function viewController;
  Function generateArray;
  Function passChanger;
  List array;
  bool isRunning;
  int passCounter;

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

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {

        if(constraints.maxWidth > 1000){

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
                          widget.passChanger(0);
                          bubbleSort(widget.array, widget.viewController,speedAnimation);
                        }: null,
                        child: const Text("BubbleSort"),
                      ),
                      TextButton(
                          onPressed: !widget.isRunning ? (){
                            sortingTrChanger(2);
                            widget.passChanger(0);
                            mergeSort(widget.array, 0, widget.array.length, widget.viewController,speedAnimation);
                          } : null,
                          child: const Text("MergeSort")
                      ),
                      TextButton(
                          onPressed: !widget.isRunning ? (){
                            sortingTrChanger(3);
                            widget.passChanger(0);
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
                      style: const TextStyle(color: Colors.brown)
                  ),
                  const SizedBox(height: 30),
                  Text("The number is just an estimate and doesn't reflect the real number of steps: ${widget.passCounter}",
                    style: const TextStyle(color: Colors.brown),
                  ),
                ],
              )
          );
        }
        else{

          return SizedBox(
              height: 200,
              width: 600,
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
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextButton(
                          onPressed: !widget.isRunning ?() {
                            sortingTrChanger(1);
                            widget.passChanger(0);
                            bubbleSort(widget.array, widget.viewController,speedAnimation);
                          }: null,
                          child: const Text("BubbleSort"),
                        ),
                        TextButton(
                            onPressed: !widget.isRunning ? (){
                              sortingTrChanger(2);
                              widget.passChanger(0);
                              mergeSort(widget.array, 0, widget.array.length, widget.viewController,speedAnimation);
                            } : null,
                            child: const Text("MergeSort")
                        ),
                        TextButton(
                            onPressed: !widget.isRunning ? (){
                              sortingTrChanger(3);
                              widget.passChanger(0);
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
                      style: const TextStyle(color: Colors.brown)
                  ),
                  const SizedBox(height: 30),
                  Text("The number is just an estimate and doesn't reflect the real number of steps: ${widget.passCounter}",
                    style: const TextStyle(color: Colors.brown),
                  ),
                ],
              )
          );
        }
      },
    );
  }
}


