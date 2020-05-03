import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:onlabproject/model/ProfileData.dart';

class MyFirebaseProfileManager {
  FirebaseDatabase _database = FirebaseDatabase.instance;
  FirebaseUser _user;
  DatabaseReference _profileRef;

  MyFirebaseProfileManager();

  Future<MyFirebaseProfileManager> init({user: FirebaseUser}) async {
    /*if(user != null) {
      _user = user;
    } else {*/
      _user = await FirebaseAuth.instance.currentUser();
   // }

    _profileRef = _database.reference().child(_user.uid).child('profile');

    return this;
  }

  addOrUpdateProfile(ProfileData data) {
    _profileRef.set(data.toJson());
  }

  Future<ProfileData> getProfileData() async {
    return ProfileData.fromSnapshot(await _profileRef.once());
  }

  onChildChanged(Function callback(Event event)) {
    _profileRef.onChildChanged.listen(callback);
  }
}