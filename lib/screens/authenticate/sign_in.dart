import 'package:flutter/material.dart';
import 'package:jrup/services/auth.dart';
import 'package:jrup/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toogleView;
  SignIn({this.toogleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //firebase instance
  final AuthService _authService = AuthService();
  //form key
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';

  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 4.0,
              title: Text('Sign in to Jrup'),
              actions: [
                FlatButton.icon(
                  icon: Icon(Icons.person, color: Colors.white),
                  label: const Text(
                    'Sign up',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    widget.toogleView();
                  },
                ),
              ],
            ),
            body: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 50.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          //email
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(3.0),
                              ),
                            ),
                            labelText: 'Enter email',
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          //password
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(3.0),
                              ),
                            ),
                            labelText: 'Enter password',
                          ),

                          keyboardType: TextInputType.text,
                          obscureText: true,
                          validator: (val) => val.length < 6
                              ? 'Enter a password 6+ chars long'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          margin: EdgeInsets.all(32.0),
                          child: Material(
                            elevation: 5.0,
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(10.0),
                            child: MaterialButton(
                              // minWidth: MediaQuery.of(context).size.width,
                              minWidth: 200.0,
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              splashColor: Colors.teal[900],
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() => loading = true);
                                  dynamic result = await _authService
                                      .signInWithEmailAndPassword(
                                          email, password);

                                  if (result == null) {
                                    setState(() {
                                      loading = false;
                                      error =
                                          'could not sign in or verify your credentials';
                                    });
                                  }
                                }
                              },
                              child: Text(
                                'Sign in',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
