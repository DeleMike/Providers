import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jrup/models/user.dart';
import 'package:jrup/screens/home/create_room_form.dart';
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
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.indigo[50],
            appBar: AppBar(
              title: Text('Home Screen'),
              actions: [
                FlatButton.icon(
                  onPressed: () async {
                    var value = await _authService.signOut();
                    if (value != null) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('Something went wrong, could not sign out'),
                        ),
                      );
                    }
                  },
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  label: Text(
                    'logout',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            body: Container(),
          )
        : Unverified(
            title: 'ACCOUNT NOT VERIFIED',
            message:
                'Please check your mail inbox for the message to verify your email registration.',
            authService: _authService,
          );
  }
}
