import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:jrup/interfaces/login_factory.dart';
import 'package:jrup/interfaces/register_factory.dart';
import 'package:jrup/models/user.dart';

class AuthService implements LoginFactory, RegisterFactory {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  //create user object based on FirebaseUser
  User _customUserFromFirebaseUser(auth.User newUser) {
    return newUser != null
        ? User(uid: newUser.uid, isVerified: newUser.emailVerified)
        : null;
  }

  ///returns a stream values of user auth changes
  Stream<User> get authState {
    return _auth.authStateChanges().map(_customUserFromFirebaseUser);
  }

  @override
  Future signInWithEmailAndPassword() async {
    // TODO: implement signInWithEmailAndPassword
  }

  @override
  Future registerWithEmailAndPassword() async {
    // TODO: implement registerWithEmailAndPassword
  }

  @override
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future forgotPassword() async {
    // TODO: implement forgotPassword
  }
}