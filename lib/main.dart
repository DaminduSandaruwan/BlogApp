import 'package:blog_app/Mapping.dart';
import 'package:flutter/material.dart';
import 'Authentication.dart';

void main() => runApp(BlogApp());

class BlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DS Blog App",
      theme: ThemeData(
        primarySwatch: Colors.pink,     
      ),
      home: MappingPage(
        auth: Auth(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}