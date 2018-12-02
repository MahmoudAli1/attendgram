import 'package:flutter/material.dart';
import 'login.dart';
import 'home_widget.dart';
import 'event_info_page.dart';
import 'Record_Page.dart';

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
}