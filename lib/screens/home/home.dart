import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jrup/models/user.dart';
import 'package:jrup/services/auth.dart';
import 'package:jrup/shared/unverified.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
    ]);

    final userStatus = Provider.of<User>(context, listen: false);
    bool userIsVerified = userStatus.isVerified;
    print('User is verified: $userIsVerified');

    return userIsVerified == true
        ? Scaffold(
            backgroundColor: Colors.indigo[50],
            appBar: AppBar(
              title: Text('Home Screen'),
            ),
            body: Center(
              child: Text('Shop items'),
            ),
          )
        : Unverified(
            title: 'ACCOUNT NOT VERIFIED',
            message:
                'Please check your mail inbox for the message to verify your email registration.',
            authService: _authService,
          );
  }
}
