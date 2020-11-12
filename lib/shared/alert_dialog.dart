import 'package:flutter/material.dart';

class AlertBox extends StatelessWidget {
  final String title;
  final String message;

  AlertBox({this.title, this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('$title'),
      content: Text('$message'),
      actions: [
        FlatButton(
          child: Text('okay'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

      ],
      elevation: 24.0,
    );
  }
}