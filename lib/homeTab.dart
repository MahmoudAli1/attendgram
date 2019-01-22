//import 'package:flutter/material.dart';
//import 'event_info_page.dart';
//import 'package:seniorproject_11_27/eventData.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'myData.dart';
//class homeTab extends StatefulWidget {
//  @override
//  _homeTabState createState() => _homeTabState();
//}
//
//class _homeTabState extends State<homeTab> {
//  List<myData> allData = [];
//
//  @override
//  void initState() {
//    DatabaseReference ref = FirebaseDatabase.instance.reference();
//    ref.child('node-name').once().then((DataSnapshot snap) {
//      var keys = snap.value.keys;
//      var data = snap.value;
//      allData.clear();
//      for (var key in keys) {
//        myData d = new myData(
//          data[key]['fname'],
//        );
//        allData.add(d);
//      }
//      setState(() {
//        print('Length : ${allData.length}');
//      });
//    });
//  }
//
//
//  /*@override
//  Widget build(BuildContext context) {
//    return Container(
//      decoration: new BoxDecoration(color: Colors.white),
//      child: new ListView.builder(
//        itemCount: items.length,
//        itemBuilder: (context, index) {
//          return ListTile(
//            title: Text('${items[index]}'),
//            onTap: () {
//              Navigator.of(context).pushNamed(EventInfoPage.tag);
//            },
//          );
//        },
//      ),
//    );
//  }*/
//
//  @override
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: new AppBar(
//        title: new Text('Firebase Data'),
//      ),
//      body: new Container(
//          child: allData.length == 0
//              ? new Text(' No Data is Available')
//              : new ListView.builder(
//            itemCount: allData.length,
//            itemBuilder: (_, index) {
//              return UI(
//                allData[index].name,
//                allData[index].profession,
//                allData[index].message,
//              );
//            },
//          )),
//    );
//  }
//
//  Widget UI(String name, String profession, String message) {
//    return new Card(
//      elevation: 10.0,
//      child: new Container(
//        padding: new EdgeInsets.all(20.0),
//        child: new Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            new Text('Name : $name',style: Theme.of(context).textTheme.title,),
//            new Text('Profession : $profession'),
//            new Text('Message : $message'),
//          ],
//        ),
//      ),
//    );
//  }
//}