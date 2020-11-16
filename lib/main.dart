import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jrup/models/user.dart';
import 'package:jrup/screens/wrapper.dart';
import 'package:jrup/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
