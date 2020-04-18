import 'package:flutter/material.dart';

class LoginRegisterPage extends StatefulWidget {
  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  
  void validateAndSave(){

  }

  void moveToRegister(){

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("My Blog App")),
        backgroundColor: Colors.black,
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Form(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 10.0),
              Hero(
                tag: 'hero',
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 55.0,
                    child: Image.asset('images/homelogo.png'),
                  ),
                ),
              SizedBox(height: 20.0),

              //Email
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email'
                ),
              ),
              SizedBox(height: 10.0),
              //Password
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password'
                ),
              ),
              SizedBox(height: 20.0),

              //LoginButton
              RaisedButton(
                child: Text("Login",style: TextStyle(fontSize: 20.0)),
                textColor: Colors.white,
                color: Colors.pink,
                onPressed: validateAndSave,
              ),

              //CreateButton
              FlatButton(
                child: Text("Not have a Account? Create Account!",style: TextStyle(fontSize: 14.0)),
                textColor: Colors.red,
                onPressed: moveToRegister,
              ),
            ],
          ),
        ),
      ),
    );
  }
}