import 'package:brewcrew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _userFromFirebaseUser(FirebaseUser user) {
    return user!= null ? User(uid: user.uid) : null;
  } //auth change user streem
  Stream<User?> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }
//sign in anom
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
//sign in with email &password

//register with email &password
  Future registerwithpasseord(String email,String password)async
  {
    try {
   AuthResult result= await _auth.createUserWithEmailAndPassword(email: email, password: password);
   FirebaseUser user =result.user;
   return  _userFromFirebaseUser(user);

    }
    catch(e)
    {
  print(e.toString());
  return null;
    }
  }
//sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
