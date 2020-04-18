import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _logoutUser(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.black,
      ),
      
      body: Container(
        
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          margin: const EdgeInsets.only(left: 70.0,right: 70.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.flip_to_back),
                iconSize: 50,
                color: Colors.green,
                onPressed: (){},
              ),
              IconButton(
                icon: Icon(Icons.add_a_photo),
                iconSize: 40,
                color: Colors.blue,
                onPressed: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}