import 'package:firebase_database/firebase_database.dart';
import 'package:onlabproject/firebase/MyFirebaseAuthManager.dart';
import 'package:onlabproject/model/ProfileModel.dart';
import 'package:onlabproject/model/TransferItemModel.dart';

class MyFirebaseDatabaseManager {
  static FirebaseDatabase _database = FirebaseDatabase.instance;

  static addOrUpdateProfile(ProfileModel data) {
    DatabaseReference profileRef = _database
        .reference()
        .child(MyFirebaseAuthManager.user.uid)
        .child('profile');
    profileRef.set(data.toJson());
  }

  static Future<ProfileModel> getProfileData() async {
    DatabaseReference profileRef = _database
        .reference()
        .child(MyFirebaseAuthManager.user.uid)
        .child('profile');
    return ProfileModel.fromSnapshot(await profileRef.once());
  }

  static onProfileChildChanged(Function callback(Event event)) {
    DatabaseReference profileRef = _database
        .reference()
        .child(MyFirebaseAuthManager.user.uid)
        .child('profile');
    profileRef.onChildChanged.listen(callback);
  }

  static addOrUpdateTransferItem(TransferItemModel data) async {
    DatabaseReference transferListRef = _database
        .reference()
        .child(MyFirebaseAuthManager.user.uid)
        .child("transfer_list");

    var list = List();

    var snapshot = await transferListRef.once();
    if (snapshot.value != null) {
      for (var item in snapshot.value) {
        list.add(item);
      }
      list.add(data.toJson());
    } else {
      list.add(data.toJson());
    }
    transferListRef.set(list);
  }

  static Future<List<TransferItemModel>> getTransferList() async {
    DatabaseReference transferListRef = _database
        .reference()
        .child(MyFirebaseAuthManager.user.uid)
        .child('transfer_list');
    var snapshot = await transferListRef.once();

    List<TransferItemModel> list = List<TransferItemModel>();
    if(snapshot.value != null) {
      for(var item in snapshot.value) {
        list.add(TransferItemModel.fromSnapshot(item));
      }
    }
    return list;
  }

  static onTransferListChildChanged(Function callback(Event event)) {
    DatabaseReference transferListRef = _database
        .reference()
        .child(MyFirebaseAuthManager.user.uid)
        .child('transfer_list');
    transferListRef.onChildChanged.listen(callback);
  }

  static onChildAdded(Function callback(Event event)) {
    DatabaseReference transferListRef = _database
        .reference()
        .child(MyFirebaseAuthManager.user.uid)
        .child('transfer_list');
    transferListRef.onChildAdded.listen(callback);
  }
}
