import 'package:blog_app/LoginRegisterPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(BlogApp());

class BlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Blog App",
      theme: ThemeData(
        primarySwatch: Colors.pink,     
      ),
      home: LoginRegisterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}