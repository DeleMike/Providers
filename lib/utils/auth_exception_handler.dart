import 'package:jrup/utils/auth_result_status.dart';

///AuthExceptionHandler used to handle error messages that might be thrown by FirebaseAuthException
class AuthExceptionHandler {
  ///used to check mate exceptions by FirebaseAuth
  static handleException(e) {
    print(e.code);
    var status;
    switch (e.code) {
      case "invalid-email":
        status = AuthResultStatus.invalidEmail;
        break;
      case "wrong-password":
        status = AuthResultStatus.wrongPassword;
        break;
      case "user-not-found":
        status = AuthResultStatus.userNotFound;
        break;
      case "user-disabled":
        status = AuthResultStatus.userDisabled;
        break;
      case "network-request-failed":
        status = AuthResultStatus.networkRequestNotFound;
        break;
      case "too-many-requests":
        status = AuthResultStatus.tooManyRequests;
        break;
      case "operation-not-allowed":
        status = AuthResultStatus.operationNotAllowed;
        break;
      case "email-already-in-use":
        status = AuthResultStatus.emailAlreadyExists;
        break;
      default:
        status = AuthResultStatus.undefined;
    }
    return status;
  }

  ///
  /// Accepts AuthExceptionHandler.errorType and generates custom messages
  ///
  static generateExceptionMessage(exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case AuthResultStatus.invalidEmail:
        errorMessage = 'Your email address appears to be malformed.';
        break;
      case AuthResultStatus.wrongPassword:
        errorMessage = 'Your password is wrong.';
        break;
      case AuthResultStatus.userNotFound:
        errorMessage = 'User with this email doesn\'t exist.';
        break;
      case AuthResultStatus.userDisabled:
        errorMessage = 'User with this email has been disabled.';
        break;
      case AuthResultStatus.tooManyRequests:
        errorMessage = 'Too many requests. Try again later.';
        break;
      case AuthResultStatus.operationNotAllowed:
        errorMessage = 'Signing in with Email and Password is not enabled.';
        break;
        case AuthResultStatus.networkRequestNotFound:
        errorMessage = 'No internet connection';
        break;
      case AuthResultStatus.emailAlreadyExists:
        errorMessage =
            'The email has already been registered. Please login or reset your password.';
        break;
      default:
        errorMessage = 'An undefined error happened. Please contact support team';
    }
    return errorMessage;
  }
}
