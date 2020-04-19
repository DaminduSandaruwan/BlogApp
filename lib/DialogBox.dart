import 'package:flutter/material.dart';

class DialogBox{
  information(BuildContext context, String title, String description){
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          backgroundColor: Colors.black,
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.redAccent,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Okay"),
              onPressed: (){
                return Navigator.pop(context);
              },    
            ),
          ],
        );
      }    
    );
  }
}