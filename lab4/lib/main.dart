import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Зубко, лабораторная 4',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Степени элементов:'),
          ),
          body: ListView.builder(
              padding: const EdgeInsets.all(25.0),
              itemBuilder: (context, index) {
                Divider();
                return Text('2 в степени $index = ${pow(2, index)} ');
              })),
    );
  }
}
