import 'package:flutter/material.dart';
import 'Record_Page.dart';

class EventInfoPage extends StatefulWidget {
  static String tag = 'event-info-page';
  @override
  State<StatefulWidget> createState() {
    return _EventInfoPageState();
  }
}

class _EventInfoPageState extends State<EventInfoPage> {

  @override
  Widget build(BuildContext context) {
    final eventName = Text(
      'item 0',
      style: TextStyle(fontSize: 30.0, color: Colors.blue),
      textAlign: TextAlign.center,
    );

    final time = Text(
      'Time: From 11:00 PM to 1:00 AM',
      style: TextStyle(color: Colors.black54),
    );

    final date = Text(
      'Date: From 10, Nov, 2018 To 15, Nov, 2018',
      style: TextStyle(color: Colors.black54),
    );

    final type = Text(
      'Type: Public',
      style: TextStyle(color: Colors.black54),
    );

    final myRecord = FlatButton(
      child: Text(
        'My Record',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(RecordPage.tag);
      },
    );

    final requestTimeOff = FlatButton(
      child: Text(
        'Request Time Off',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
      },
    );

    final requestLeave = FlatButton(
      child: Text(
        'Request Leave',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
      },
    );

    final recordIcon = Icon(Icons.featured_play_list);
    final timeOffIcon = Icon(Icons.watch_later);
    final leaveIcon = Icon(Icons.directions_walk);

    final ConfirmButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            //Navigator.of(context).pushNamed(Home.tag);
          },
          color: Colors.lightBlueAccent,
          child: Text('Confirm Attendance', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            eventName,
            SizedBox(height: 8.0),
            time,
            SizedBox(height: 8.0),
            date,
            SizedBox(height: 8.0),
            type,
            SizedBox(height: 24.0),
            Center(
              child: new Row(
                children: <Widget>[recordIcon, myRecord],
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              child: new Row(
                children: <Widget>[timeOffIcon, requestTimeOff],
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              widthFactor: 25,
              child: new Row(
                children: <Widget>[leaveIcon, requestLeave],
              ),
            ),
            SizedBox(height: 8.0),
            ConfirmButton
          ],
        ),
      ),
    );
  }
}