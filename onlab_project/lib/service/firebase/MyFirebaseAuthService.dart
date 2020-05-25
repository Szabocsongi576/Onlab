import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:onlabproject/model/ProfileModel.dart';
import 'package:onlabproject/service/firebase/MyFirebaseDatabaseService.dart';

class MyFirebaseAuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static FirebaseUser user;

  static Future<bool> register(String email, String password, ProfileModel data) async {
    user = (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    )).user;

    if (user != null) {
      data.userId = user.uid;

      MyFirebaseDatabaseService.addOrUpdateProfile(data);
      //TODO Firebase API -> dynamic database rules handling

      return true;
    } else {
      return false;
    }
  }

  static Future<AuthResponse> signInWithEmailAndPassword(String email, String password) async {
    try {
      user = (await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      )).user;
      if (user != null) {
        return AuthResponse.LoggedIn;
      } else {
        return AuthResponse.OtherError;
      }
    } catch(e) {
      AuthResponse response;
      if (Platform.isAndroid) {
        switch (e.message) {
          case 'There is no user record corresponding to this identifier. The user may have been deleted.':
            response = AuthResponse.UserNotFound;
            break;
          case 'The password is invalid or the user does not have a password.':
            response = AuthResponse.PasswordNotValid;
            break;
          case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
            response = AuthResponse.NetworkError;
            break;
          default:
            response = AuthResponse.OtherError;
            break;
        }
      } else if (Platform.isIOS) {
        switch (e.code) {
          case 'Error 17011':
            response = AuthResponse.UserNotFound;
            break;
          case 'Error 17009':
            response = AuthResponse.PasswordNotValid;
            break;
          case 'Error 17020':
            response = AuthResponse.NetworkError;
            break;
          default:
            response = AuthResponse.OtherError;
            break;
        }
      }
      return response;
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }
}

enum AuthResponse { UserNotFound, PasswordNotValid, NetworkError, OtherError, LoggedIn }