import 'package:flutter/material.dart';
import 'package:jrup/flavor.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final flavor = Provider.of<Flavor>(context); //get flavor value
    return MaterialApp(
      title: flavor.toString(),
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body : Container(
          child: Center(
            child: Text('Hello'),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}