import 'package:flutter/material.dart';
import 'package:jrup/services/database.dart';

class CreateRoomForm extends StatefulWidget {
  final String title;
  final bool isTeacher;
  CreateRoomForm({this.title, this.isTeacher});

  @override
  _CreateRoomFormState createState() => _CreateRoomFormState();
}

class _CreateRoomFormState extends State<CreateRoomForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  var text = 'show';
  bool isObscure = true;
  var icon = Icons.visibility_off;

  DatabaseService databaseService;

  _toggleView() {
    setState(() {
      isObscure = !isObscure;
      (text == 'show') ? text = 'hide' : text = 'show';
      (icon == Icons.visibility_off)
          ? icon = Icons.visibility
          : icon = Icons.visibility_off;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          height: 380.0,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 25.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _nameController,
                  validator: (val) => val.isEmpty ? 'Enter a room name' : null,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(16.0),
                    hintText: 'Room name',
                    fillColor: Colors.indigo[100],
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.indigo[100], width: 2.0),
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
                Stack(
                  alignment: Alignment(0, 0),
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      validator: (val) => val.length < 6
                          ? 'Enter a password 6+ chars long'
                          : null,
                      obscureText: isObscure,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16.0),
                        hintText: 'Room password',
                        focusColor: Colors.black,
                        fillColor: Colors.indigo[100],
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.indigo[100], width: 2.0),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 1,
                      top: 1,
                      child: FlatButton.icon(
                        splashColor: Colors.transparent,
                        onPressed: () {
                          _toggleView();
                        },
                        icon: Icon(icon),
                        label: Text('$text'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35.0),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: RaisedButton(
                        child: Text(
                          'Create Now',
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
                            print('email: $name');
                            print('password: $key');
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
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
