import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:jrup/Utils/log.dart';
import 'package:jrup/models/User.dart';
import 'package:jrup/services/database.dart';
import 'package:jrup/shared/alert_dialog.dart';

class AuthService {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  //create user object based on FirebaseUser
  User _userFromUserCredentials(auth.User user) {
    return user != null ? User(uid: user.uid) : null;
  }

  ///auth change user stream; used to get data on user login status
  Stream<User> get user {
    //to know if the user is signed in or out.
    return _auth.authStateChanges().map(
        _userFromUserCredentials); //will return null if user is signed out.
  }

  //sign in anonymously
  Future signInAnon() async {
    try {
      auth.UserCredential _result =
          await _auth.signInAnonymously(); //user signs in anonymously
      auth.User user = _result.user; //get user details
      return _userFromUserCredentials(
          user); //return customised user credentials
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      auth.UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password); // sign in a new user with passed in data
      auth.User user = result.user;

      return _userFromUserCredentials(user); //to get the customised format
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      // creates a new user with passed in data
      auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      auth.User user = result.user;
      Log(
          tagName: 'AuthService',
          message: 'user created with email and password');

      await DatabaseService(uid: user.uid)
          .updateUserData('0', 'new crew member', 100);
      print('AuthService: Data Collection Created');

      return _userFromUserCredentials(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut(); //user signs out
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
