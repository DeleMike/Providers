import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:jrup/interfaces/login_factory.dart';
import 'package:jrup/interfaces/register_factory.dart';
import 'package:jrup/models/user.dart';
import 'package:jrup/utils/auth_exception_handler.dart';
import 'package:jrup/utils/auth_result_status.dart';

class AuthService implements LoginFactory, RegisterFactory {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  static var errorMessage = '';
  AuthResultStatus _status;

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
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      auth.UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      auth.User user = userCredential.user;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      return _customUserFromFirebaseUser(user);
    } on auth.FirebaseAuthException catch (e) {
      print(e.toString());
      _status = AuthExceptionHandler.handleException(e);
      errorMessage = AuthExceptionHandler.generateExceptionMessage(_status);
      return null;
    }
  }

  @override
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      auth.UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      auth.User user = userCredential.user;
      await user.sendEmailVerification(); //send a verification mail to user
      return _customUserFromFirebaseUser(user);
    } on auth.FirebaseAuthException catch (e) {
      print(e.toString());
      _status = AuthExceptionHandler.handleException(e);
      errorMessage = AuthExceptionHandler.generateExceptionMessage(_status);
      return null;
    }
  }

  @override
  Future signOut() async {
    try {
      return await _auth.signOut();
    } on auth.FirebaseAuthException catch (e) {
      _status = AuthExceptionHandler.handleException(e);
      errorMessage = AuthExceptionHandler.generateExceptionMessage(_status);
      return null;
    }
  }

  @override
  Future forgotPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on auth.FirebaseAuthException catch (e) {
      _status = AuthExceptionHandler.handleException(e);
      errorMessage = AuthExceptionHandler.generateExceptionMessage(_status);
      return null;
    }
  }
}
