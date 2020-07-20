import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:crash_course/navigateMe.dart';
import 'package:crash_course/startupName.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final wordPair = WordPair.random();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

        home:Scaffold(

      body:PageView(
        children: [

          RandomWords(),

        ],

      ),

      )
    );
  }
}

class JoinerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(

    );
  }
}

