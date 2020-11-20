import 'package:flutter/material.dart';
import 'package:jrup/services/database.dart';

class Room extends StatefulWidget {
  final bool isTeacher;
  Room({this.isTeacher});

  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  DatabaseService _databaseService;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        title: Text('Rooms'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.name,
              controller: _nameController,
              validator: (val) => val.isEmpty ? 'Enter a room name' : null,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16.0),
                hintText: 'course name',
                fillColor: Colors.indigo[100],
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo[100], width: 2.0),
                ),
              ),
            ),
            SizedBox(height: 25.0),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              controller: _passwordController,
              validator: (val) => val.isEmpty ? 'Enter a room name' : null,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16.0),
                hintText: 'course password',
                fillColor: Colors.indigo[100],
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo[100], width: 2.0),
                ),
              ),
            ),
            SizedBox(height: 25.0),
            Row(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: RaisedButton(
                        child: Text(
                          'Create now',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.indigo,
                        onPressed: () async {
                          //login into account
                          if (_formKey.currentState.validate()) {
                            String name =
                                _nameController.text.toString().trim();
                            String key =
                                _passwordController.text.toString().trim();
                           

                          _databaseService = DatabaseService(password: key);
                          _databaseService.createNewCourse(name, key);
                            print(
                                'email: $name');
                            print(
                                'password: $key');
                           
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: RaisedButton(
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.indigo,
                        onPressed: () async {
                          //cancel dialog
                          //Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
            Center(
              child: Container(
                child: Text('Room View, isTeacher: ${widget.isTeacher}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
