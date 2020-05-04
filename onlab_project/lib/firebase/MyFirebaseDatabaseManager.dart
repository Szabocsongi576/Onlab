import 'package:firebase_database/firebase_database.dart';
import 'package:onlabproject/firebase/MyFirebaseAuthManager.dart';
import 'package:onlabproject/model/ProfileModel.dart';
import 'package:onlabproject/model/TransferItemModel.dart';

class MyFirebaseDatabaseManager {
  static FirebaseDatabase _database = FirebaseDatabase.instance;

  static addOrUpdateProfile(ProfileModel data) {
    DatabaseReference profileRef = _database.reference().child(MyFirebaseAuthManager.user.uid).child('profile');
    profileRef.set(data.toJson());
  }

  static Future<ProfileModel> getProfileData() async {
    DatabaseReference profileRef = _database.reference().child(MyFirebaseAuthManager.user.uid).child('profile');
    return ProfileModel.fromSnapshot(await profileRef.once());
  }

  static onProfileChildChanged(Function callback(Event event)) {
    DatabaseReference profileRef = _database.reference().child(MyFirebaseAuthManager.user.uid).child('profile');
    profileRef.onChildChanged.listen(callback);
  }

  static addOrUpdateTransferItem(TransferItemModel data) {
    DatabaseReference transferListRef = _database.reference().child(MyFirebaseAuthManager.user.uid).child('transfer_list');
    transferListRef.set(data.toJson());
  }

  static Future<TransferItemModel> getTransferList() async {
    DatabaseReference transferListRef = _database.reference().child(MyFirebaseAuthManager.user.uid).child('transfer_list');
    return TransferItemModel.fromSnapshot(await transferListRef.once());
  }

  static onTransferListChildChanged(Function callback(Event event)) {
    DatabaseReference transferListRef = _database.reference().child(MyFirebaseAuthManager.user.uid).child('transfer_list');
    transferListRef.onChildChanged.listen(callback);
  }

  static onChildAdded(Function callback(Event event)) {
    DatabaseReference transferListRef = _database.reference().child(MyFirebaseAuthManager.user.uid).child('transfer_list');
    transferListRef.onChildAdded.listen(callback);
  }
}