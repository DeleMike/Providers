import 'package:flutter/material.dart';
import 'package:jrup/flavor.dart';
import 'package:jrup/my_app.dart';
import 'package:provider/provider.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(Provider<Flavor>.value(
    value: Flavor.prod, //reads value from here
    child: MyApp()
  ));
}
