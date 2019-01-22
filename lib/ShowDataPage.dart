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
  List<myData> allData = [];
  var id ;
  var UserEvenIndex = [] ;
  var IDs ;
  @override
  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) async {
      id = user.uid;
      globalUserId = id ;
    });

      var currentUser = ref.child('Users');



        currentUser.once().then((DataSnapshot snap){
          Map<dynamic,dynamic> map = snap.value ;
          var data = map.values ;
          var keys = map.entries ;
          keys.forEach((k) {
            var userID = k.key ;
            if (userID == id ){
              Map<dynamic,dynamic> map2  = k.value ;
              var EventsData = map2.entries ;
              EventsData.forEach((r) {
                var EventIDs = r.key ;
                if (EventIDs == 'EventIDs'){
                  IDs = r.value ;
                }
                if(EventIDs=='Name'){
                  currentUserName=r.value;
                }
                if(EventIDs=='description'){
                  currentUserDescripition=r.value;

                }

              });


            }

          });
          print('this is $data') ;
          print(keys) ;
          print("this is the new code here") ;
//          for (var i in indexes){
//            UserEvenIndex[i] =data[i]['EventIDs'] ;
//          }
        });
        ref.child('Events').once().then((DataSnapshot snap) {
//        var index = [0, 1, 2, 3];
        var data = snap.value;
        allData.clear();
        for (var i in IDs) {
        print(i);
        myData d = new myData(
        data[i]['name'],
        data[i]['date'],
        data[i]['time'],
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
      appBar: new AppBar(
        title: new Text('Event List'),
        backgroundColor: Colors.blueGrey,
      ),
      body: new Container(
          child: allData.length == 0
              ? new Text(' Loading Data')
              : new ListView.builder(
            itemCount: allData.length,
            itemBuilder: (_, index) {
              return UI(
                allData[index].name,
                IDs[index],index,
              );
            },
          )),
    );
  }

  Widget UI(String name, var j,var i) {
    return new Card(
      elevation: 10.0,
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new FlatButton(
              child: Text(' $name',style: Theme.of(context).textTheme.title,),
              onPressed: () {
                eventIndex=j;
                pageIndex = i ;
                Navigator.of(context).pushNamed(EventInfoPage.tag);
                },
            ),
          ],
        ),
      ),
    );
  }
}