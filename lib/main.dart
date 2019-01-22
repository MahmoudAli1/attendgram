/*import 'package:flutter/material.dart';
import 'login.dart';
import 'home_widget.dart';
import 'event_info_page.dart';
import 'Record_Page.dart';
import 'package:firebase_database/firebase_database.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    Home.tag: (context) =>  Home(),
    EventInfoPage.tag: (context) => EventInfoPage(),
    RecordPage.tag: (context) => RecordPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: LoginPage(),
      routes: routes,
    );
  }
}*/


import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'ShowDataPage.dart';
import 'login.dart';
import 'home_widget.dart';
import 'event_info_page.dart';
import 'Record_Page.dart';
import 'globals.dart';

void main() => runApp(new MaterialApp(home: new MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    Home.tag: (context) =>  Home(),
    EventInfoPage.tag: (context) => EventInfoPage(eventIndex),
    RecordPage.tag: (context) => RecordPage(),
  };


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: LoginPage(),
      routes: routes,
    );
  }
}