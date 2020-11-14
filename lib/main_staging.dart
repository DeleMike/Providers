import 'package:flutter/material.dart';
import 'package:jrup/flavor.dart';
import 'package:jrup/my_app.dart';
import 'package:provider/provider.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(Provider<Flavor>.value(
    value: Flavor.staging, //reads value from here
    child: MyApp()
  ));
}

