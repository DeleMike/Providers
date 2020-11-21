import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //a room reference
  CollectionReference courseCollection = FirebaseFirestore.instance.collection('orders');

}
