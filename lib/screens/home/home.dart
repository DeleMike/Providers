import 'package:flutter/material.dart';
import 'package:jrup/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    content: Text('Something went wrong, could not sign out'),
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
