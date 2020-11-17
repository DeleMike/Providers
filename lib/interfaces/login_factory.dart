class LoginFactory{
   ///allows user to sign in into their account
  Future signInWithEmailAndPassword(String email, String password) async {}

  //sign in with Google Provider

  ///allows user to sign out from their account
  Future signOut() async {}

  ///allows user to reset password upon forgeting their passoword
  Future forgotPassword(String email) async{}

}