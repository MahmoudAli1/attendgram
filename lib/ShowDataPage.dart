import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'myData.dart';
import 'event_info_page.dart';
import 'dart:developer';
import 'globals.dart';
import 'package:firebase_auth/firebase_auth.dart' ;
class ShowDataPage extends StatefulWidget {

  @override
  _ShowDataPageState createState() => _ShowDataPageState();
}

class _ShowDataPageState extends State<ShowDataPage> {
  List<eventData> allData = [];
  var id ;
  var UserEvenIndex = [] ;
  var IDs ;
  @override
  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
//    FirebaseAuth.instance.currentUser().then((FirebaseUser user) async {
//      id = user.uid;
//
//    });
    var currentUser = ref.child('Users').child(globalUserId);



    currentUser.once().then((DataSnapshot snap){
      Map<dynamic,dynamic> map = snap.value ;
      var data = map.values ;
      //   print(data);
      var keys = map.entries ;
      //  print(keys);
      keys.forEach((k) {
        var eventIDs = k.key ;
        if (eventIDs == 'Event_Ids'){
          IDs = k.value ;
          //      print(IDs);
        }

      });
    });
    ref.child('Events').once().then((DataSnapshot snap) {
      var data = snap.value;
      allData.clear();
      for (var i in IDs) {
        print(i);
        eventData d = new eventData(
          data[i]['name'],
          data[i]['date'],
          data[i]['time'],
          data[i]['Accessability']
        );
        allData.add(d);
      }
      setState(() {
        print('Length : ${allData.length}');
      });

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: new AppBar(
        title: new Text('Firebase Data'),
      ),
      body: new Container(
          child: allData.length == 0
              ? new Text(' No Data is Available')
              : new ListView.builder(
            itemCount: allData.length,
            itemBuilder: (_, index) {
              return UI(
                allData[index].name, allData[index].date, allData[index].time,allData[index].Accessability,
                IDs[index],index,
              );
            },
          )
      ),
    );
  }

  _CheckType (String Accessability ){
    if(Accessability=="Public") {
      return true;
    }

    return false ;


  }

  Widget UI(String name, String date, String time, String Accessability, var j,var i) {
    return new Card(
      elevation: 10.0, // SHADOW
      color: Colors.blueGrey, // CARD COLOR
     // shape: ,
      child: new Container(
        padding: const EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,
          left: 5.0,
        ),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new Container(
              child: new Image.asset(
                'assets/images/attendgram.png',
                height: 60.0,
                fit: BoxFit.cover,
              ),
            ),
            new FlatButton(
              child: RichText(
                  text: TextSpan(
                  style: Theme.of(context).textTheme.title,
                  children: <TextSpan>[
                    TextSpan(
                      text: '$name\n',
                      style: TextStyle(color: Colors.amberAccent.withOpacity(0.6), fontSize: 20),
                    ),
                    TextSpan(
                      text: '$date\n',
                      style: TextStyle(color: Colors.lightBlue.withOpacity(0.8), fontSize: 15),
                    ),
                    TextSpan(
                      text: '$time',
                      style: TextStyle(color: Colors.greenAccent.withOpacity(1.0), fontSize: 15),
                    ),
                  ],
                ),
              ),
              onPressed: () {
                eventIndex=j;
                pageIndex = i ;
                Navigator.of(context).pushNamed(EventInfoPage.tag);
              },
            ),
            new Center(
                child: _CheckType(Accessability) == true ? new Icon(Icons.add_circle) : new Icon(Icons.do_not_disturb_on)
            )

          ],
        ),
      ),
    );
  }
}