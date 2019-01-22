/*import 'package:flutter/material.dart';

class CreateEventTab extends StatelessWidget {
  CreateEventTab();

  class CreateEventTab extends StatefulWidget {
  static String tag = 'createEvent-page';
  @override
  _CreateEventState createState() => new _CreateEventState();
  }

  class _LoginPageState extends State<LoginPage> {

  @override

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Create Event'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(

          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[

            SizedBox(height: 24.0),
        Text(
          'Event Name: ',
          style: TextStyle(color: Colors.black54),
        ),
            SizedBox(height: 0.0),
        TextFormField(
        ),

            SizedBox(height: 35.0),
            Center(
              child: new Row(
                children: <Widget>[
                  Text(
                'Time: From      ',
                style: TextStyle(color: Colors.black54),
              ),
              Icon(Icons.check_box_outline_blank),
              Text(
                '     , To      ',
                style: TextStyle(color: Colors.black54),
              ),
              Icon(Icons.check_box_outline_blank),],
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: new Row(
                children: <Widget>[
                  Text(
                'Date: From      ',
                style: TextStyle(color: Colors.black54),
              ),
              Icon(Icons.check_box_outline_blank),
              Text(
                '     , To      ',
                style: TextStyle(color: Colors.black54),
              ),
              Icon(Icons.check_box_outline_blank),],
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: new Row(
                children: <Widget>[
                  Text(
                'Type:',
                style: TextStyle(color: Colors.black54),),
              Radio(

              ),
              Text(
                'Public',
                style: TextStyle(color: Colors.black54),
              ),
              Radio(
                value: false,
              ),
              Text(
                'Private',
                style: TextStyle(color: Colors.black54),
              )],
              ),
            ),
            SizedBox(height: 80.0),

        Padding(

          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Material(
            borderRadius: BorderRadius.circular(30.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: _eventCreated,
              color: Colors.lightBlueAccent,
              child: Text('Create Event', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
          ],
        ),
      ),
    );
  }

  Future<void> _eventCreated() async {
    return showDialog<void>(
     // context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Event Created'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('A new event are created Successfully'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
*/

import 'package:firebase_auth/firebase_auth.dart';
import 'home_widget.dart';
import 'package:flutter/material.dart';

class CreateEventTab extends StatefulWidget {
  static String tag = 'login-page';
  noSuchMethod(Invocation i) => super.noSuchMethod(i);
  @override
  _CreateEventState createState() => new _CreateEventState();
}

class _CreateEventState extends State<CreateEventTab> {

  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Create Event'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(

          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[

            SizedBox(height: 24.0),
            Text(
              'Event Name: ',
              style: TextStyle(color: Colors.black54),
            ),
            SizedBox(height: 0.0),
            TextFormField(
            ),

            SizedBox(height: 35.0),
            Center(
              child: new Row(
                children: <Widget>[
                  Text(
                    'Time:       ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  RaisedButton (
                    child: Text('Select Time'),
                    onPressed: _selectTime ,
                    color: Colors.lightBlue,
                    textColor:  Colors.white,
                  ),],
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: new Row(
                children: <Widget>[
                  Text(
                    'Date:        ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  RaisedButton (
                    child: Text('Select Date'),
                    onPressed: _showDateTimePicker ,
                    color: Colors.lightBlue,
                    textColor:  Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: new Row(
                children: <Widget>[
                  Text(
                    'Public:   ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  new Switch(value: _value, onChanged: (bool value){_onChanged(value);}),
                ],
              ),
            ),
            SizedBox(height: 80.0),

            Padding(

              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                borderRadius: BorderRadius.circular(30.0),
                shadowColor: Colors.lightBlue.shade100,
                elevation: 5.0,
                child: MaterialButton(
                  minWidth: 200.0,
                  height: 42.0,
                  onPressed: _eventCreated,
                  color: Colors.lightBlue,
                  child: Text('Create Event', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  Future<void> _eventCreated() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Event Created'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('A new event are created Successfully'),
                // Text('reset your password'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  Future<void> _showDateTimePicker() async {
    final DateTime selected = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1960),
      lastDate: new DateTime(2050),
    );

    setState(() {});
  }

  Future<void> _selectTime() async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: new TimeOfDay.now(),
    );
    if (picked != null )
      print(picked);
    setState(() {

    });
  }
  void _onChanged(bool value){
    setState(() {
      _value = value;
    });
  }
}