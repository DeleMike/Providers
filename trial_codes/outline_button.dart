// import 'package:flutter/material.dart';

// Center(
//               child: Container(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.all(8.0),
//                       width: 250.0,
//                       child: OutlinedButton(
//                         onPressed: () async {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => Room(
//                                 isTeacher: true,
//                               ),
//                             ),
//                           );
//                         },
//                         style: OutlinedButton.styleFrom(
//                           primary: Colors.indigo[900],
//                           side:
//                               BorderSide(color: Colors.indigo[300], width: 2.0),
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.all(24.0),
//                           child: Text(
//                             'CREATE A ROOM',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.all(8.0),
//                       width: 250.0,
//                       child: OutlinedButton(
//                         onPressed: () async {
//                           // _showCreateRoomDialog('Join existing room', false) ;
//                         },
//                         style: OutlinedButton.styleFrom(
//                           primary: Colors.indigo[900],
//                           side:
//                               BorderSide(color: Colors.indigo[300], width: 2.0),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(24.0),
//                           child: Text(
//                             'JOIN A ROOM',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),