import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthImplementaion{
  Future <String> SignIn (String email, String password);
  Future <String> SignUp(String email, String password);
  Future<String> getCurrentUser();
  Future<void> signOut();
  
  

}

class Auth implements AuthImplementaion{


  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future <String> SignIn (String email, String password) async 
  {
    FirebaseUser user = (await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user;
    return user != null ? user.uid : null;
  }

  Future <String> SignUp(String email, String password) async 
  {
    FirebaseUser user = (await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user;
    return user != null ? user.uid : null;
  }

  Future<String> getCurrentUser() async{
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user != null ? user.uid : null;
  }

  Future<void> signOut() async{
    _firebaseAuth.signOut();
  }

}