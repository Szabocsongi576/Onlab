import 'dart:async';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:onlabproject/model/ProfileModel.dart';
import 'package:onlabproject/model/MovingItemModel.dart';
import 'package:onlabproject/service/firebase/MyFirebaseAuthService.dart';
import 'package:onlabproject/service/firebase/MyFirebaseStorageService.dart';

class MyFirebaseDatabaseService {
  static FirebaseDatabase _database = FirebaseDatabase.instance;

  static Future<void> addOrUpdateProfile(ProfileModel data) async {
    DatabaseReference profileRef = _database
        .reference()
        .child(MyFirebaseAuthService.user.uid)
        .child('profile');
    await profileRef.set(data.toJson());
  }

  static Future<ProfileModel> getProfileData() async {
    DatabaseReference profileRef = _database
        .reference()
        .child(MyFirebaseAuthService.user.uid)
        .child('profile');
    return ProfileModel.fromSnapshot(await profileRef.once());
  }

  static Future<List<MovingItemModel>> getMovingItems() async {
    DatabaseReference movingListRef = _database
        .reference()
        .child(MyFirebaseAuthService.user.uid)
        .child("moving_list");
    DataSnapshot snapshot = await movingListRef.once();
    Map<dynamic, dynamic> trSnapshotMap = snapshot.value;

    List<MovingItemModel> list = List<MovingItemModel>();
    if(trSnapshotMap != null) {
      trSnapshotMap.forEach((key, value) {
        list.add(MovingItemModel.fromSnapshot(key, value));
      });
    }
    return list;
  }

  static Future<void> addMovingItem(MovingItemModel data, List<File> images) async {
    DatabaseReference movingListRef = _database
        .reference()
        .child(MyFirebaseAuthService.user.uid)
        .child("moving_list");

    for (int i = 0; i < data.objectList.length; i++) {
      String imageURL;
      if(images[i] != null) {
        imageURL = await MyFirebaseStorageService.uploadFile(images[i]);
      }
      data.objectList[i].imageURL = imageURL;
    }

    var newItemRef = movingListRef.push();
    await newItemRef.set(data.toJson());
    var objectListRef = newItemRef.orderByChild("address")
        .equalTo(data.address)
        .reference()
        .child("objectList");
    data.objectList.forEach((objectItem) async {
      var objectItemRef = objectListRef.push();
      await objectItemRef.set(objectItem.toJson());
    });
  }

  static Future<void> removeMovingItem(String id) async {
    DatabaseReference movingListItemRef = _database
        .reference()
        .child(MyFirebaseAuthService.user.uid)
        .child("moving_list")
        .child(id);
    await movingListItemRef.remove();
  }

  static Future<void> updateMovingItemState(String id, int newState) async {
    DatabaseReference movingListItemRef = _database
        .reference()
        .child(MyFirebaseAuthService.user.uid)
        .child("moving_list")
        .child(id);

    await movingListItemRef.child("state").update({"state": newState});
  }

  static void registerMovingListChildAddedListener(
      Function(Event event) callback) {
    DatabaseReference movingListRef = _database
        .reference()
        .child(MyFirebaseAuthService.user.uid)
        .child('moving_list');

    movingListRef.onChildAdded.listen(callback);
  }

  static void registerMovingListChildChangedListener(
      Function(Event event) callback) {
    DatabaseReference movingListRef = _database
        .reference()
        .child(MyFirebaseAuthService.user.uid)
        .child('moving_list');

    movingListRef.onChildChanged.listen(callback);
  }

  static void registerMovingListChildRemovedListener(
      Function(Event event) callback) {
    DatabaseReference movingListRef = _database
        .reference()
        .child(MyFirebaseAuthService.user.uid)
        .child('moving_list');

    movingListRef.onChildRemoved.listen(callback);
  }
}
