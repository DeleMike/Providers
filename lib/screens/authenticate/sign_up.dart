import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jrup/services/auth.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //field values
  var text = 'show';
  bool isObscure = true;
  var icon = Icons.visibility_off;

  final AuthService _authService = AuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var brandImage;

  @override
  void initState() {
    super.initState();
    brandImage = Image.asset(
      'assets/images/google_logo.png',
      width: 70.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    //set device to potrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    //used for form fields
    _toggleView() {
      setState(() {
        isObscure = !isObscure;
        (text == 'show') ? text = 'hide' : text = 'show';
        (icon == Icons.visibility_off)
            ? icon = Icons.visibility
            : icon = Icons.visibility_off;
      });
    }

    //display Alert Dialog
    _showDialog(String title, String message) {
      return showDialog(
        context: context,
        child: AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text('okay'),
            ),
          ],
        ),
      );
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
              child: brandImage,
            ),

            SizedBox(height: 25.0),

            //brand label
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Create a new account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //sign up card
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Card(
                margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 25.0),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(16.0),
                            hintText: 'Email',
                            fillColor: Colors.indigo[100],
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.indigo[100], width: 2.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 25.0),
                        Stack(
                          alignment: Alignment(0, 0),
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              validator: (val) => val.length < 6
                                  ? 'Enter a password 6+ chars long'
                                  : null,
                              controller: _passwordController,
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
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: RaisedButton(
                                child: Text(
                                  'Register',
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.indigo,
                                onPressed: () async {
                                  //register user
                                  if (_formKey.currentState.validate()) {
                                    dynamic result = await _authService
                                        .registerWithEmailAndPassword(
                                            _emailController.text,
                                            _passwordController.text);

                                    if (result == null) {
                                      _showDialog('Message', 'Please try again, something went wrong');
                                    }
                                    print('email: ${_emailController.text}');
                                    print('password: ${_passwordController.text}');
                                  }
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                              child: FlatButton(
                                splashColor: Colors.transparent,
                                child: Text(
                                  'Already have an account?',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.indigo,
                                  ),
                                ),
                                onPressed: () {
                                  //go to login page
                                  widget.toggleView();
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
