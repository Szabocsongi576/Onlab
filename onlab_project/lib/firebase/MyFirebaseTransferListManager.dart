import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:onlabproject/model/TransferListItemData.dart';

class MyFirebaseTransferListManager {
  final FirebaseUser _user;
  String _userId;

  FirebaseDatabase _database = FirebaseDatabase.instance;

  DatabaseReference _transferListRef;

  bool _loading = false;

  MyFirebaseTransferListManager(this._user) {
    _init();
  }

  _init() async {
    _loading = true;

    _userId = _user.uid;

    if(_database.reference().child(_userId).child('transfer_list') == null) {
      _database.reference().child(_userId).child('transfer_list').push().set(_userId);
    }
    _transferListRef = _database.reference().child('transfer_list').child(_userId);

    _loading = false;
  }

  addOrUpdateTransferItem(TransferListItemData data) {
    _database.reference().child('profile').child(_userId).set(data.toJson());
  }

  Future<TransferListItemData> getProfileData() async {
    return TransferListItemData.fromSnapshot(await _transferListRef.once());
  }

  onChildChanged(Function callback(Event event)) {
    _transferListRef.onChildChanged.listen(callback);
  }

  onChildAdded(Function callback(Event event)) {
    _transferListRef.onChildAdded.listen(callback);
  }
}