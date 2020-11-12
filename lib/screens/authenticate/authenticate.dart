import 'package:flutter/material.dart';
import 'package:jrup/screens/authenticate/register.dart';
import 'package:jrup/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView(){
    // ignore: unused_element
    setState((){
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toogleView: toggleView);
    }else{
      return Register(toogleView: toggleView);
    }
  }
}