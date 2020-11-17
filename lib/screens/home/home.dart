import 'package:flutter/material.dart';
import 'package:jrup/models/user.dart';
import 'package:jrup/services/auth.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    final userStatus = Provider.of<User>(context, listen: false);
    bool userIsVerified = userStatus.isVerified;
    print('User is verified: $userIsVerified');

    //display Alert Dialog
    _showDialog(String title, String message) {
      return Scaffold(
        backgroundColor: Colors.indigo[50],
        appBar: AppBar(
          title: Text('Home Screen'),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.only(top: 32.0),
            height: 250.0,
            width: double.infinity,
            child: Card(
              margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title,
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          message,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 35.0),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () async {
                          var value = await _authService.signOut();
                          if (value != null) {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Something went wrong, could not sign out'),
                              ),
                            );
                          }
                        },
                        child: Text(
                          'OKAY',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              elevation: 2.0,
            ),
          ),
        ),
      );
    }

    return userIsVerified == true
        ? Scaffold(
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
                child: Text('Home Screen'),
                // child: userIsVerified == true
                //     ? Text('Home Screen True')
                //     //: //_showMe(),
                //     : _showDialog('A title',
                //         'A content')), //     'Your account has not being verified.\nPlease check your mail and try again')),
              ),
            ),
          )
        : _showDialog('ACCOUNT NOT VERIFIED',
            'Please check your mail inbox for the message to verify your email registration.');
  }
}
