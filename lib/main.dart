import 'package:flutter/material.dart';
import 'package:jrup/flavor.dart';
import 'package:provider/provider.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(Provider<Flavor>.value(
    value: Flavor.dev, //reads value from here
    child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final flavor = Provider.of<Flavor>(context);
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
