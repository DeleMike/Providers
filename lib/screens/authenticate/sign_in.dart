import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  var text = 'show';
  bool isObscure = true;
  var icon = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    //print("ChangerVal initial value = ${_changerVal.heightVal}");
    // final val = Provider.of<Changer>(context);
  
  _toggleView() {
    setState((){
      isObscure = ! isObscure;
      (text == 'show') ? text = 'hide' : text = 'show'; 
      (icon == Icons.visibility) ? icon = Icons.visibility_off : icon = Icons.visibility;
    });
    
  }

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
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(height: 25.0),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(16.0),
                    hintText: 'email',
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
                      obscureText: _toggleView(),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16.0),
                        hintText: 'Password',
                        focusColor: Colors.black,
                        fillColor: Colors.indigo[100],
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.indigo[100], width: 2.0),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5,
                      child: FlatButton.icon(
                        splashColor: Colors.transparent,
                        onPressed: (){}, 
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
                          //sign up, if account is not created
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.bottomCenter,
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
              ]),
            ),
            elevation: 2.0,
          ),
        ),
      ),
    );
  }
}
