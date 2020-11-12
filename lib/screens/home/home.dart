import 'package:flutter/material.dart';
import 'package:jrup/screens/home/brew_list.dart';
import 'package:jrup/screens/home/settings_form.dart';
import 'package:jrup/services/auth.dart';
import 'package:jrup/services/database.dart';
import 'package:jrup/models/brew.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
          child: SettingsForm(),
        );
      });
    }

    //used for state management; this will constantly check for the stream value to know DB present state
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService()
          .brews, //app will listen to this value via the stream provider
      child: Scaffold(
        backgroundColor: Colors.teal[50],
        appBar: AppBar(
          title: const Text('Welcome'),
          elevation: 4.0,
          actions: [
            FlatButton.icon(
              icon: Icon(Icons.person, color: Colors.white),
              label: const Text(
                'logout',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings, color: Colors.white),
              label: const Text(
                'settings',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => _showSettingsPanel(),
            ),
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
