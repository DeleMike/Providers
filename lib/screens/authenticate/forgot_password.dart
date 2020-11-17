import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jrup/services/auth.dart';

class ForgotPassword extends StatelessWidget {
  final brandImage = Image.asset(
    'assets/images/google_logo.png',
    width: 70.0,
  );
  final AuthService _authService = AuthService();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //set device to potrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

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
              child: Text('OKAY'),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false, //removes the overflow error
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        title: Text('Forgot Password'),
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
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: RaisedButton(
                            child: Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.indigo,
                            onPressed: () async {
                              //send forgot password
                              if (_formKey.currentState.validate()) {
                                dynamic result = await _authService
                                    .forgotPassword(_emailController.text
                                        .toString()
                                        .trim());
                                if (result == null) {
                                  _showDialog(
                                      'Could not send password reset link',
                                      AuthService.errorMessage);
                                } else {
                                  showDialog(
                                    context: context,
                                    child: AlertDialog(
                                      title: Text('Message'),
                                      content: Text('A password reset link have been sent to your email address.'),
                                      actions: [
                                        FlatButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text('OKAY'),
                                        ),
                                      ],
                                    ),
                                  ).then((val) => Navigator.pop(context)); //close forgot password screen
                                  
                                }
                                print('email: ${_emailController.text}');
                              }
                            },
                          ),
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
