import 'package:flutter/material.dart';
import 'package:jrup/models/user.dart';
import 'package:jrup/screens/authenticate/authenticate.dart';
import 'package:jrup/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userAuthState = Provider.of<User>(context);

    //return either Authenticate widget or Home widget
    if (userAuthState == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
