import 'package:flutter/material.dart';

class LoginRegisterPage extends StatefulWidget {
  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}

enum FormType{
  login,
  register
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  
  final formKey = GlobalKey<FormState>();
  FormType _formType = FormType.login;
  String _email = "";
  String _password = "";

  void validateAndSave(){

  }

  void moveToRegister(){
    formKey.currentState.reset();
    setState(() {
      _formType =  FormType.register;
    });
  }

  void moveToLogin(){
    formKey.currentState.reset();
    setState(() {
      _formType =  FormType.login;
    });
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
          key: formKey,

          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: createInputs() + createButtons(),
          ),
        ),
      ),
    );
  }


  List<Widget> createInputs(){
    return[
      SizedBox(height: 10.0),
      logo(),
      SizedBox(height: 20.0),

      //Email
      TextFormField(
        decoration: InputDecoration(
          labelText: 'Email'
        ),
        validator: (value){
          return value.isEmpty ? 'Email is required' : null;
        },
        onSaved: (value){
          return _email = value;
        },
      ),
      SizedBox(height: 10.0),

      //Password
      TextFormField(
        decoration: InputDecoration(
          labelText: 'Password'
        ),
      ),
      SizedBox(height: 20.0),
    ];
  }

  Widget logo(){
    return
      Hero(
        tag: 'hero',
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 55.0,
          child: Image.asset('images/homelogo.png'),
        ),
      );   
  }

  List<Widget> createButtons(){
    if(_formType == FormType.login){
        return[
          //LoginButton
          RaisedButton(
            child: Text("Login", style: TextStyle(fontSize: 20.0)),
            textColor: Colors.white,
            color: Colors.pink,
            onPressed: validateAndSave,
          ),

          //CreateButton
          FlatButton(
            child: Text("Not have a Account? Create Account!", style: TextStyle(fontSize: 14.0)),
            textColor: Colors.red,
            onPressed: moveToRegister,
          ),
        ];
      }
    else{
      return[
          //LoginButton

          RaisedButton(
            child: Text("Create", style: TextStyle(fontSize: 20.0)),
            textColor: Colors.white,
            color: Colors.pink,
            onPressed: validateAndSave,
          ),

          //CreateButton
          FlatButton(
            child: Text("Already have a Account? Login!", style: TextStyle(fontSize: 14.0)),
            textColor: Colors.red,
            onPressed: moveToLogin,
          ),
        ];
      }
  }

}

