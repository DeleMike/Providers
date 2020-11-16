import 'package:flutter/material.dart';
import 'package:jrup/Valuer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    StreamProvider<int>(
      create: (_) => Valuer(initialValue: 100).value,
      initialData: 100,
      catchError: (_, error) => error,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('widget built here');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;
  HomePage({this.title});
  @override
  Widget build(BuildContext context) {
    //var countVal = Provider.of<Valuer>(context);
    //print('Value = ${countVal.initialValue}');
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Consumer<int>(
          builder: (_, int value, __) => Column(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(16.0),
                height: 250.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueGrey[value],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
