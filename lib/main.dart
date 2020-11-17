import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jrup/models/user.dart';
import 'package:jrup/screens/authenticate/authenticate.dart';
import 'package:jrup/screens/authenticate/forgot_password.dart';
import 'package:jrup/screens/home/home.dart';
import 'package:jrup/screens/wrapper.dart';
import 'package:jrup/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //routes
  static final String authenticatePage = '/authenticatePage';
  static final String homePage = '/homePage';
  static final String forgotPassword = '/forgotPassword';
 
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().authState,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/' : (context) => Wrapper(),
          authenticatePage: (context) => Authenticate(),
          homePage: (context) => Home(),
          forgotPassword : (context) => ForgotPassword(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
