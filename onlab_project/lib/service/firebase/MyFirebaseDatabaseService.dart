import 'dart:async';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:onlabproject/model/ProfileModel.dart';
import 'package:onlabproject/model/TransferItemModel.dart';
import 'package:onlabproject/service/firebase/MyFirebaseAuthService.dart';
import 'package:onlabproject/service/firebase/MyFirebaseStorageService.dart';

class MyFirebaseDatabaseService {
  static FirebaseDatabase _database = FirebaseDatabase.instance;

  static addOrUpdateProfile(ProfileModel data) {
    DatabaseReference profileRef = _database
        .reference()
        .child(MyFirebaseAuthService.user.uid)
        .child('profile');
    profileRef.set(data.toJson());
  }

  static Future<ProfileModel> getProfileData() async {
    DatabaseReference profileRef = _database
        .reference()
        .child(MyFirebaseAuthService.user.uid)
        .child('profile');
    return ProfileModel.fromSnapshot(await profileRef.once());
  }

  static Future<List<TransferItemModel>> getTransferItems() async {
    DatabaseReference transferListRef = _database
        .reference()
        .child(MyFirebaseAuthService.user.uid)
        .child("transfer_list");
    DataSnapshot snapshot = await transferListRef.once();
    Map<dynamic, dynamic> trSnapshotMap = snapshot.value;

    List<TransferItemModel> list = List<TransferItemModel>();
    if(trSnapshotMap != null) {
      trSnapshotMap.forEach((key, value) {
        list.add(TransferItemModel.fromSnapshot(key, value));
      });
    }
    return list;
  }

  static Future<void> addTransferItem(TransferItemModel data, List<File> images) async {
    DatabaseReference transferListRef = _database
        .reference()
        .child(MyFirebaseAuthService.user.uid)
        .child("transfer_list");

    for (int i = 0; i < data.objectList.length; i++) {
      var imageURL = await MyFirebaseStorageService.uploadFile(images[i]);
      data.objectList[i].imageURL = imageURL;
      print("uploaded");
    }

    var newItemRef = transferListRef.push();
    await newItemRef.set(data.toJson());
    print("new item created");
    var objectListRef = newItemRef.orderByChild("address")
        .equalTo(data.address)
        .reference()
        .child("objectList");
    data.objectList.forEach((objectItem) async {
      var objectItemRef = objectListRef.push();
      await objectItemRef.set(objectItem.toJson());
    });
    print("done");
  }

  static Future<void> removeTransferItem(String id) async {
    DatabaseReference transferListItemRef = _database
        .reference()
        .child(MyFirebaseAuthService.user.uid)
        .child("transfer_list")
        .child(id);
    await transferListItemRef.remove();
  }

  static Future<void> updateTransferItemState(String id, int newState) async {
    DatabaseReference transferItemRef = _database
        .reference()
        .child(MyFirebaseAuthService.user.uid)
        .child("transfer_list")
        .child(id);

    await transferItemRef.child("state").set(newState);
  }

  static Future<void> patchTransferList(TransferItemModel item) async {
    DatabaseReference transferListRef = _database
        .reference()
        .child(MyFirebaseAuthService.user.uid)
        .child('transfer_list');

    var itemRef = transferListRef
        .child(item.id)
        .reference();

    await itemRef.child("state").update({"state": item.state});
  }

  static void registerTransferListChildAddedListener(
      Function(Event event) callback) {
    DatabaseReference transferListRef = _database
        .reference()
        .child(MyFirebaseAuthService.user.uid)
        .child('transfer_list');

    transferListRef.onChildAdded.listen(callback);
  }

  static void registerTransferListChildChangedListener(
      Function(Event event) callback) {
    DatabaseReference transferListRef = _database
        .reference()
        .child(MyFirebaseAuthService.user.uid)
        .child('transfer_list');

    transferListRef.onChildChanged.listen(callback);
  }

  static void registerTransferListChildRemovedListener(
      Function(Event event) callback) {
    DatabaseReference transferListRef = _database
        .reference()
        .child(MyFirebaseAuthService.user.uid)
        .child('transfer_list');

    transferListRef.onChildRemoved.listen(callback);
  }
}
