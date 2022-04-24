import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
// googleSignIn will initialize
  final googleSignIn = GoogleSignIn();
// when user login then his/her gmail detail will store in the _user
  GoogleSignInAccount? _user;
  GoogleSignInAccount? get user => _user!;

  Future googleLogin() async {
    // this is will show the pop up
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;

    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    // passing the tokens for the google login to firebase
    final Credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(Credential);

    // to update the ui
    notifyListeners();
  }

  Future logOut() async {
    FirebaseAuth.instance.signOut();
  }
}
