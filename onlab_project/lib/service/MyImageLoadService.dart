import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:onlabproject/Resource/StringResource.dart';

class MyImageLoadService {

  static Future<File> loadImage(String dialogResult) async {
    var source;
    switch (dialogResult) {
      case StringResource.CAMERA:
        source = ImageSource.camera;
        break;
      case StringResource.GALLERY:
        source = ImageSource.gallery;
        break;
    }

    File img;
    try {
      img = await ImagePicker.pickImage(source: source);
      if (img != null) {
        return img;
      } else {
        print("nincs kep");
        return null;
      }
    } catch(PlatformException) {
      print("error");
      return null;
    }
  }
}
