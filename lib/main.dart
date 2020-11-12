import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final logo = Image.asset(
    'assets/images/pixton-avatar-full-body.png',
    width: 100.0,
    height: 100.0,
  );

  @override
  Widget build(BuildContext context) {
    //used for state management; this will constantly check for the stream value to know login present state
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Container(),
        debugShowCheckedModeBanner: false,
    );
  }
}
