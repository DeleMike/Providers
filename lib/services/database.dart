import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jrup/models/User.dart';
import 'package:jrup/models/brew.dart';

///This creates a database access to cloud firestore
class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference: used to reference a collection in the database
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  //custom brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot){
    
    return snapshot.docs.map((doc) {
      // print('Brew Name: ${doc.data()['name']}');
      // print('Strength: ${doc.data()['strength']}');
      // print('Sugars: ${doc.data()['sugars']}');

      return Brew(
        name: doc.data()['name'] ?? '',
        strength: doc.data()['strength'] ?? 0 ,
        sugars: doc.data()['sugars'] ?? '0'
      );
    }).toList(); 
  }

  //get jrup streams: to get firestore data
  Stream<List<Brew>> get brews {
    return brewCollection
        .snapshots() //this returns the state of a database at the time this method is called.
        .map(_brewListFromSnapshot); // That is, with all its properties.
  }

  //user data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data()['name'],
      strength: snapshot.data()['strength'],
      sugars: snapshot.data()['sugars']
    );
  }

  //get user doc stream
  Stream<UserData> get userData {
    return brewCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
