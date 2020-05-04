import 'package:firebase_auth/firebase_auth.dart';
import 'package:onlabproject/firebase/MyFirebaseDatabaseManager.dart';
import 'package:onlabproject/model/ProfileModel.dart';

class MyFirebaseAuthManager {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static FirebaseUser user;

  static Future<bool> register(String email, String password, ProfileModel data) async {
    user = (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    )).user;

    if (user != null) {
      data.userId = user.uid;

      MyFirebaseDatabaseManager.addOrUpdateProfile(data);
      //TODO Firebase API -> dynamic database rules handling

      return true;
    } else {
      return false;
    }
  }

  static Future<bool> signInWithEmailAndPassword(String email, String password) async {
    user = (await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;
    if (user != null) {
     return true;
    } else {
      return false;
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }
}