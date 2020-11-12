import 'package:flutter/material.dart';
import 'package:jrup/models/User.dart';
import 'package:jrup/screens/authenticate/authenticate.dart';
import 'package:jrup/screens/home/home.dart';
import 'package:provider/provider.dart';

/// listens for changes if the user's logged in or out

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Home or Authenticate Widget
    final user = Provider.of<User>(
        context); //accessing the value coming from the stream from the main.dart file
    if (user != null) {
      return Home();
    } else {
      return Authenticate();
    }
  }
}
