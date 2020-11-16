import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jrup/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //field values
  var text = 'show';
  bool isObscure = true;
  var icon = Icons.visibility_off;

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    //print("ChangerVal initial value = ${_changerVal.heightVal}");
    // final val = Provider.of<Changer>(context);

    _toggleView() {
      setState(() {
        isObscure = !isObscure;
        (text == 'show') ? text = 'hide' : text = 'show';
        (icon == Icons.visibility_off)
            ? icon = Icons.visibility
            : icon = Icons.visibility_off;
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false, //removes the overflow error
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        title: Text('Test Model'),
      ),
      body: Container(
        child: Column(
          children: [
            //brand image
            Container(
              margin: EdgeInsets.only(bottom: 10.0, top: 30.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Image.asset(
                'assets/images/google_logo.png',
                width: 70.0,
              ),
            ),

            SizedBox(height: 25.0),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Login to your account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //login card
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Card(
                margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(children: [
                    SizedBox(height: 25.0),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16.0),
                        hintText: 'Email',
                        fillColor: Colors.indigo[100],
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.indigo[100], width: 2.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 25.0),
                    Stack(
                      alignment: Alignment(0, 0),
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: isObscure,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(16.0),
                            hintText: 'Password',
                            focusColor: Colors.black,
                            fillColor: Colors.indigo[100],
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.indigo[100], width: 2.0),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 1,
                          child: FlatButton.icon(
                            splashColor: Colors.transparent,
                            onPressed: () {
                              _toggleView();
                            },
                            icon: Icon(icon),
                            label: Text('$text'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.indigo,
                          onPressed: () {},
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                          child: FlatButton(
                            splashColor: Colors.transparent,
                            child: Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.indigo,
                              ),
                            ),
                            onPressed: () {
                              //go to sign up page
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FlatButton(
                          child: Text(
                            'Forgot password',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.indigo,
                            ),
                          ),
                          onPressed: () {
                            //functionality for forgot password
                          },
                        ),
                      ),
                    ),
                  ]),
                ),
                elevation: 2.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
