import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> { 

  @override
  Widget build(BuildContext context) {
     //print("ChangerVal initial value = ${_changerVal.heightVal}");
    // final val = Provider.of<Changer>(context);
    return Scaffold(
        appBar: AppBar(
    title: Text('Sign in into app'),
        ),
        body: Container(
    child: Center(
      child: Card(
        margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Name',
                  fillColor: Colors.indigo[100],
                ),

              ),

              SizedBox(height: 25.0),

              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password'
                ),
              ),
            ]
          ),
          
        ),
        elevation: 4.0,
      ),
      
    ),
        ),
      );
  }
}