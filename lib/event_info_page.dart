import 'package:flutter/material.dart';
import 'Record_Page.dart';
import 'globals.dart';
import 'package:firebase_database/firebase_database.dart';
import 'myData.dart';
class EventInfoPage extends StatefulWidget {
  static String tag = 'event-info-page';
  var eventNum = eventIndex;
  EventInfoPage(this.eventNum);
  @override
  State<StatefulWidget> createState() {
    return _EventInfoPageState(eventNum);
  }
}

class _EventInfoPageState extends State<EventInfoPage> {
  _EventInfoPageState(var eventNum);
   List<evntData> allData= [];
  static String eventName, eventTime, eventDate;
  var occurrences ;
  var occurr=1;
  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref.child('Events').once().then((DataSnapshot snap) {
      var data = snap.value;
     // allData.clear();
        print(eventIndex);
      evntData d = new evntData(
           data[eventIndex]['name'],
           data[eventIndex]['date'],
           data[eventIndex]['time'],
        );
      eventName=data[eventIndex]['name'];
      eventDate=d.date;
      eventTime=d.time;
      //allData.add(d);

      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final eventTitle = Text(
      '$eventName',
      style: TextStyle(fontSize: 30.0, color: Colors.blue),
      textAlign: TextAlign.center,
    );

    final time = Text(
      'Time: From $eventTime',
      style: TextStyle(color: Colors.black54),
    );

    final date = Text(
      'Date: From $eventDate',
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
            DatabaseReference ref = FirebaseDatabase.instance.reference();
            ref.child("Events").child('$eventIndex').child('Occurrences').once().then((DataSnapshot snap){
              Map<dynamic,dynamic> data = snap.value ;
              var occurrenceIndex = data.entries ;
              occurr = occurrenceIndex.last.value;
          _AttendenceConfirmation;
              print(occurrenceIndex);
//              occurrenceIndex.forEach((index){
//                 occurrences = index.key ;
//                 occurr = occurrences.length();
//                 occurr++ ;
//                 print(occurr) ;
//                 print("this is occ") ;
//              });


            });

            ref.child("Events").child('$eventIndex').child('Occurrences').child('$occurr');
            Map<dynamic,dynamic> UserAttendance = {
              '$globalUserId' : 'P'
            };
            ref.child("Events").child('$eventIndex').child('Occurrences').child('$occurr').child('${UserAttendance.keys.first}')
                .set(UserAttendance['$globalUserId']);
            occurr++ ;
          },
          color: Colors.lightBlueAccent,
          child: Text('Confirm Attendance', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Event'),
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            eventTitle,
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
  Future<void> _AttendenceConfirmation() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Attendence Confirmed'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You attended seccessfully'),
                //Text('reset your password'),
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