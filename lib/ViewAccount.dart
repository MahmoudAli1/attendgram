
import 'package:flutter/material.dart';
import 'globals.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(new ViewAccount());

class ViewAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new ViewAccountPage(),
    );
  }
}

class ViewAccountPage extends StatefulWidget {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String currentUserName, currentUserDescripition; // Add string for userInterests   <----------

  @override
  _MyViewAccountPageState createState() => new _MyViewAccountPageState();
}

class _MyViewAccountPageState extends State<ViewAccountPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text('Profile'),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: new Stack(
         // key: _formKey,
          alignment: Alignment.center,


          children: <Widget>[


            Positioned(

                child: ListView(

                  children: <Widget>[

                    SizedBox(height: 75.0),
                    Image.asset(

                      'assets/images/Profile2.png',
                      height: 120,
                      width: 120,



                    ),

                    SizedBox(height: 50.0),

                    /*Text(
                      'Add here Username',
                      textAlign: TextAlign.center,
                      style: TextStyle(

                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),*/
                    Padding(padding: EdgeInsets.only(left: 24.0, right: 24.0),
                    child: TextFormField(

                      //textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: 'Write different user name!',
                        labelText: 'user name',  // add user name here ya ahmed <------------
                        //icon: Icon(Icons.edit),
                      ),
                      onSaved: (input) => currentUserName = input,
                    ),
                    ),
                    SizedBox(height: 25.0),
                Padding(padding: EdgeInsets.only(left: 24.0, right: 24.0),
                  child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: 'Write different user description!',
                        labelText: 'user description',   // add user description ya ahmed <-------------
                        //icon: Icon(Icons.edit),
                      ),
                    onSaved: (input) => currentUserDescripition = input,
                    ),),
                    SizedBox(height: 25.0),
                Padding(padding: EdgeInsets.only(left: 24.0, right: 24.0),
                  child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: 'Write different user interests!',
                        labelText: 'user Interests',   // add user email ya ahmed <-------------
                        //icon: Icon(Icons.edit),
                      ),
                    ),),


                    SizedBox(height: 15.0),
                    /*Text(
                      'Add here user description',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17.0,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Montserrat'),
                    ),*/

                    SizedBox(height: 50.0),
                     Center(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(30.0),
                              shadowColor: Colors.lightBlue.shade100,
                              elevation: 5.0,
                              child: MaterialButton(
                                minWidth: 370.0,
                                height: 42.0,
                                //onPressed: updateProfile,
                                color: Colors.lightBlue,
                                child: Text('Update Profile', style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //SizedBox(height: 10.0),
                    /* Center(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(

                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(30.0),
                              shadowColor: Colors.lightBlue.shade100,
                              elevation: 5.0,
                              child: MaterialButton(
                                minWidth: 370.0,
                                height: 42.0,
                                //onPressed: _eventCreated,
                                color: Colors.lightBlue,
                                child: Text('Notification', style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(height: 10.0),
                     Center(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(

                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(30.0),
                              shadowColor: Colors.lightBlue.shade100,
                              elevation: 5.0,
                              child: MaterialButton(
                                minWidth: 370.0,
                                height: 42.0,
                                //onPressed: _eventCreated,
                                color: Colors.lightBlue,
                                child: Text('Settinges', style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),*/
                    //SizedBox(height: 25.0),
                  ],
                )
            )
          ],

        )

    );
  }
}

/*void updateProfile() async {
  if(_formKey.currentState.validate()){
    _formKey.currentState.save();
    try{
      FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user:user)));
    }catch(e){
      _errorOccurred(e.message);
      print(e.message);

    }
  }
}*/

