
import 'package:firebase_auth/firebase_auth.dart';
import 'home_widget.dart';
import 'SignUp.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  noSuchMethod(Invocation i) => super.noSuchMethod(i);
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,

      body: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              SizedBox(height: 100.0),
              Image.asset(

                'assets/images/attendgram.png',
                height: 300,
                width: 250,

                alignment: Alignment.center,



              ),
              TextFormField(

                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                validator: (val) => val.isEmpty ? 'Email can\'t be empty.' : null,

                decoration: InputDecoration(
                  hintText: 'Username',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
                onSaved: (input) => _email = input,
              ),
              SizedBox(height: 15.0),
              TextFormField(
                autofocus: false,

                obscureText: true,
                validator: (val) => val.isEmpty ? 'Password can\'t be empty.' : null,
                decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                ),
                onSaved: (input) => _password = input,
              ),

              // SizedBox(height: 10.0),
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
                          onPressed: signIn,
                          color: Colors.lightBlue,
                          child: Text('Log In', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              FlatButton(
                child: Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.black54),
                ),
                onPressed:() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                }
              ),
            ],
          )
      ),
    );
  }

  void signIn() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user:user)));
      }catch(e){

        print(e.message);

      }
    }
  }


}