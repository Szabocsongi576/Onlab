import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:onlabproject/service/firebase/MyFirebaseAuthService.dart';
import 'package:path/path.dart';

class MyFirebaseStorageService {
  static final StorageReference storageReference = FirebaseStorage(storageBucket: "gs://onlab-a6959.appspot.com/").ref();

  static Future<String> uploadFile(File file) async {

    final StorageUploadTask uploadTask = storageReference.child(MyFirebaseAuthService.user.uid).child(basename(file.path)).putFile(file);
    final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
    final String url = (await downloadUrl.ref.getDownloadURL());
    
    return url;
  }
}