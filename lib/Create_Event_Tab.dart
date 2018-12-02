import 'package:flutter/material.dart';

class CreateEventTab extends StatelessWidget {
  CreateEventTab();


  @override
  Widget build(BuildContext context) {
    final tabTitle = Text(
      'Create Event',
      style: TextStyle(fontSize: 30.0, color: Colors.blue),
      textAlign: TextAlign.center,
    );

    final eventNameText = Text(
      'Event Name: ',
      style: TextStyle(color: Colors.black54),
    );

    final eventName = TextFormField(
    );

    final time = Text(
      'Time: From      ',
      style: TextStyle(color: Colors.black54),
    );
    final to = Text(
      '     , To      ',
      style: TextStyle(color: Colors.black54),
    );

    final date = Text(
      'Date: From      ',
      style: TextStyle(color: Colors.black54),
    );

    final type = Text(
      'Type:',
      style: TextStyle(color: Colors.black54),
    );

    final eventType1 = Radio(
    );

    final public = Text(
      'Public',
      style: TextStyle(color: Colors.black54),
    );

    final eventType2 = Radio(
      value: false,
    );

    final private = Text(
      'Private',
      style: TextStyle(color: Colors.black54),
    );


    final box = Icon(Icons.check_box_outline_blank);

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
          child: Text('Create Event', style: TextStyle(color: Colors.white)),
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
            tabTitle,
            SizedBox(height: 24.0),
            eventNameText,
            SizedBox(height: 0.0),
            eventName,
            SizedBox(height: 8.0),
            SizedBox(height: 24.0),
            Center(
              child: new Row(
                children: <Widget>[time, box, to, box],
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              child: new Row(
                children: <Widget>[date, box, to, box],
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              child: new Row(
                children: <Widget>[type, eventType1, public, eventType2, private],
              ),
            ),
            SizedBox(height: 80.0),
            ConfirmButton
          ],
        ),
      ),
    );
  }
}