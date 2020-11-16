import 'package:flutter/material.dart';
import 'package:jrup/main.dart';
import 'package:jrup/models/user.dart';
import 'package:jrup/services/auth.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    //display Alert Dialog
    _showDialog(String title, String message) {
      return showDialog(
        context: context,
        child: AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            FlatButton(
              onPressed: () => Navigator.popAndPushNamed(context, MyApp.authenticatePage),
              child: Text('okay'),
            ),
          ],
        ),
      );
    }

    final userStatus = Provider.of<User>(context);
    bool userIsVerified = userStatus.isVerified;

    return (!userIsVerified)
        ? _showDialog('Message',
            'Please check your mail to verify your email registration.')
        : Scaffold(
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
                  icon: Icon(Icons.person),
                  label: Text(
                    'logout',
                  ),
                ),
              ],
            ),
            body: Center(
              child: Container(
                child: Text(
                  'The Home Screen',
                ),
              ),
            ),
          );
  }
}
