

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'globals.dart';




class editProfile extends StatefulWidget {

  @override
  _editProfileState createState() => new _editProfileState();
}

class _editProfileState extends State<editProfile> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String  _interests,_UserName,_descripition;


  DatabaseReference Ref;




  @override
  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
  }
  @override
  Widget build(BuildContext context) {
    return new ListView(
      // backgroundColor: Colors.white,

      children: <Widget>[
        Form(
            key: _formKey,
            child: ListView(

              shrinkWrap: true,
              children: <Widget>[
                SizedBox(height: 200.0),
                Image.asset(

                  'assets/images/Profile2.png',
                  height: 150,
                  width: 150,

                  alignment: Alignment.center,



                ),
                SizedBox(height: 10.0),
                TextFormField(
                  keyboardType: TextInputType.text,



                  obscureText: false,

                  decoration: InputDecoration(

                    hintText: 'User Name ',
                    contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),

                    // border: OutlineInputBorder(borderRadius: BorderRadius.circular(80.0)),
                  ),
                  onSaved: (input) => _UserName = input,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  keyboardType: TextInputType.text,
                  autofocus: false,


                  decoration: InputDecoration(
                    hintText: 'Update your Descrpition',
                    contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
                    // border: OutlineInputBorder(borderRadius: BorderRadius.circular(80.0)),
                  ),
                  onSaved: (input) => _descripition = input,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  keyboardType: TextInputType.text,
                  autofocus: false,


                  decoration: InputDecoration(
                    hintText: 'Update Interests',
                    contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
                    // border: OutlineInputBorder(borderRadius: BorderRadius.circular(90.0)),
                  ),
                  onSaved: (input) => _interests = input,
                ),

//
                SizedBox(height: 10.0),
                Center(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(

                        padding: EdgeInsets.all(20.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(30.0),
                          shadowColor: Colors.lightBlue.shade100,
                          elevation: 5.0,
                          child: MaterialButton(
                            minWidth: 300.0,
                            height: 42.0,
                            onPressed: editProfile,
                            color: Colors.lightBlue,
                            child: Text('Update', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


              ],
            )
        ),
      ],
    );
  }

  void editProfile() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{


        Ref = FirebaseDatabase.instance.reference();

        EditProfile EditedProfile= EditProfile(_UserName,_descripition,_interests);

        Ref.child('Users').setPriority(globalUserId);
        Ref.child('Users').child(globalUserId).set(EditedProfile.toJson());

      }catch(e){

        print(e.message);

      }
    }
  }




}





class EditProfile {

  String Name;
  String interests;
  String descripition;


  EditProfile(this.Name,this.descripition,this.interests);

  toJson() {
    return {

      "Name": Name,
      "descrption":descripition,
      "interests":interests,
      "Private_Event_Ids":'',
      "Public_Event_Ids":'',



    };
  }
}