import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);
  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<Login> {
  final emailController = TextEditingController(); 
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            //button for Google Sign In
            _signInButton(),

          //text field for email
          Container(
            margin: EdgeInsets.all(16.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(3.0),
                  ),
                  
                ),

                icon: Icon(Icons.email, color: Colors.black, semanticLabel: 'e-mail',),
                labelText: 'Enter email',
              ),

              keyboardType: TextInputType.text,
            ),
          ),

          SizedBox(height: 4.0,),

          //text field for password
          Container(
            margin: EdgeInsets.all(16.0),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(3.0),
                  ),
                  
                ),
                icon: Icon(Icons.person, color: Colors.black, semanticLabel: 'password',),
                labelText: 'Enter password',
              ),

              keyboardType: TextInputType.text,
            ),
          ),

          SizedBox(height:4.0,),

          Container(
             margin: EdgeInsets.all(32.0),
            child: Material(
              elevation: 5.0,
              color: Colors.teal,
              borderRadius: BorderRadius.circular(20.0),
              child: MaterialButton(
                // minWidth: MediaQuery.of(context).size.width,
                minWidth: 200.0,
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                splashColor: Colors.teal[700],
                onPressed: (){
                  print('email: ${emailController.text} and password: ${passwordController.text}');
                },
                child: Text('Login', 
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              
              ),
          ),
        ],
      ),
    );
  }

  Widget _signInButton() {
      return OutlineButton(
          splashColor: Colors.grey,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40)),
            highlightElevation: 0,
            borderSide: BorderSide(color: Colors.grey),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Image(image: AssetImage('assets/images/google_logo.png'), height: 35.0,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Sign in with Google',
                      ),
                    ),
              ],),
            ),
      );
  }
}
