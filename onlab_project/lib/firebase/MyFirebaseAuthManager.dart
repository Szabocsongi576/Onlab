import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onlabproject/firebase/MyFirebaseProfileManager.dart';
import 'package:onlabproject/model/ProfileData.dart';

class MyFirebaseAuthManager {
  static final MyFirebaseAuthManager _manager= MyFirebaseAuthManager._internal();

  factory MyFirebaseAuthManager() {
    return _manager;
  }

  MyFirebaseAuthManager._internal();

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;

  Future<bool> register(String email, String password, ProfileData data) async {
    _user = (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;

    if (_user != null) {
      data.userId = _user.uid;
      MyFirebaseProfileManager profileManager = await MyFirebaseProfileManager().init(user: _user);

      profileManager.addOrUpdateProfile(data);

      //TODO Firebase API -> dynamic database rules handling

      return true;
    } else {
      return false;
    }
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    _user = (await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;
    if (_user != null) {
     return true;
    } else {
      return false;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }


}