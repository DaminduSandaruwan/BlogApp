import 'package:blog_app/DialogBox.dart';
import 'package:flutter/material.dart';
import 'Authentication.dart';

class LoginRegisterPage extends StatefulWidget {
  LoginRegisterPage({
    this.auth,
    this.onSignedIn,
  });
  final AuthImplementaion auth;
  final VoidCallback onSignedIn;
  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();

}

enum FormType{
  login,
  register
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  DialogBox dialogBox = DialogBox();
  final formKey = GlobalKey<FormState>();
  FormType _formType = FormType.login;
  String _email = "";
  String _password = "";

  bool validateAndSave(){
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }
    else{
      return false;
    }
  }

  void validateAndSubmit() async{
    if (validateAndSave()){
      try{
        if(_formType==FormType.login){
          String userId = await widget.auth.SignIn(_email, _password);
          //dialogBox.information(context, "Congratulations!", "You are Logged in Successfully");
          print("Loging UserId= " + userId);
        }
        else{
          String userId = await widget.auth.SignUp(_email, _password);
          //dialogBox.information(context, "Congratulations!", "Your account has been created Successfully!");
          print("Register UserId= " + userId);
        }

        widget.onSignedIn();
      }
      catch(e){
        dialogBox.information(context, "Error", e.toString());
        print("Error = " + e.toString());
      }
    }
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
        backgroundColor: Colors.red,
      ),

      body: Container(
        color: Colors.grey[300],
        child: Container(          
          margin: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: createInputs() + createButtons(),
            ),
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
          labelText: 'Email',
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
        obscureText: true,
        validator: (value){
          return value.isEmpty ? 'Password is required' : null;
        },
        onSaved: (value){
          return _password = value;
        },
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
          radius: 40.0,
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
            color: Colors.redAccent,
            onPressed: validateAndSubmit,
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
            onPressed: validateAndSubmit,
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