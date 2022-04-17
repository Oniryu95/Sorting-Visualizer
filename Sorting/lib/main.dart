import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sorting/widget/Body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sorting visualizer',
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



  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {

        if(constraints.maxWidth > 1000){

          return NormalBody(title: widget.title);
        }
        else{

          return TinyBody(title: widget.title);
        }
      },
    );
  }
}

//TODO:Change container's height in TinyBody
