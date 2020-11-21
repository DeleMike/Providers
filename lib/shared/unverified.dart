import 'package:flutter/material.dart';
import 'package:jrup/services/auth.dart';

class Unverified extends StatelessWidget {
  final String title;
  final String message;
  final AuthService authService;
  Unverified({this.title, this.message, this.authService});
  @override
  Widget build(BuildContext context) {
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
                          var value = await authService.signOut();
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
}