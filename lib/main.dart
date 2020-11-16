import 'package:flutter/material.dart';
import 'package:jrup/Valuer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('widegt built here');
    return StreamProvider(
        create: (_) => Valuer().value,
          child: Center(
        child: Column(
          children: [
            Consumer<Valuer>(
              builder: (_, valuer, __) =>
                          Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(8.0),
                color: Colors.blue[valuer.initialValue],
              ),
            ),

            Consumer<Valuer>(
              builder: (_, valuer, __) =>
                           ElevatedButton(
                child: Text('Reset'),
                onPressed: () {
                  valuer.reset();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}