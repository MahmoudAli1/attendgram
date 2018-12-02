import 'package:flutter/material.dart';

class RecordPage extends StatefulWidget {
  static String tag = 'Record-page';
  @override
  State<StatefulWidget> createState() {
    return _RecordPageState();
  }
}

class _RecordPageState extends State<RecordPage> {

  @override
  Widget build(BuildContext context) {
    final eventName = Text(
      'item 0',
      style: TextStyle(fontSize: 30.0, color: Colors.blue),
      textAlign: TextAlign.center,
    );

    final absences = Text(
      'Number of absences: 1',
      style: TextStyle(color: Colors.black54),
    );

    final precentage = Text(
      'Attendance precentage: --%',
      style: TextStyle(color: Colors.black54),
    );

    final eventstate = Text(
      'Event state: Active',
      style: TextStyle(color: Colors.black54),
    );

    final recordTable = Text(
      'Record Table',
      style: TextStyle(fontSize: 30.0, color: Colors.orange),
      textAlign: TextAlign.center,
    );

    final record1 = Text(
      '15, Nov, 2018       P',
      style: TextStyle(color: Colors.lightBlueAccent),
    );

    final record2 = Text(
      '17, Nov, 2018       A',
      style: TextStyle(color: Colors.redAccent),
    );

    final record3 = Text(
      '19, Nov, 2018       P',
      style: TextStyle(color: Colors.lightBlueAccent),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            eventName,
            SizedBox(height: 24.0),
            absences,
            SizedBox(height: 8.0),
            precentage,
            SizedBox(height: 8.0),
            eventstate,
            SizedBox(height: 100.0),
            recordTable,
            SizedBox(height: 24.0),
            Center(
              child: new Row(
                children: <Widget>[record1],
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              child: new Row(
                children: <Widget>[record2],
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              widthFactor: 25,
              child: new Row(
                children: <Widget>[record3],
              ),
            ),
          ],
        ),
      ),
    );
  }
}