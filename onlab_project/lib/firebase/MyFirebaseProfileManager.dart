import 'package:firebase_database/firebase_database.dart';
import 'package:onlabproject/firebase/MyFirebaseAuthManager.dart';
import 'package:onlabproject/model/ProfileData.dart';

class MyFirebaseProfileManager {
  static FirebaseDatabase _database = FirebaseDatabase.instance;

  static addOrUpdateProfile(ProfileData data) {
    DatabaseReference profileRef = _database.reference().child(MyFirebaseAuthManager.user.uid).child('profile');
    profileRef.set(data.toJson());
  }

  static Future<ProfileData> getProfileData() async {
    DatabaseReference profileRef = _database.reference().child(MyFirebaseAuthManager.user.uid).child('profile');
    return ProfileData.fromSnapshot(await profileRef.once());
  }

  static onChildChanged(Function callback(Event event)) {
    DatabaseReference profileRef = _database.reference().child(MyFirebaseAuthManager.user.uid).child('profile');
    profileRef.onChildChanged.listen(callback);
  }
}