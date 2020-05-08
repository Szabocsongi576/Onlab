import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:onlabproject/Resource/StringResource.dart';

class CameraGalleryDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(StringResource.IMG_LOAD_DIALOG_TITLE),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, StringResource.CAMERA);
            },
            child: Text(
              StringResource.CAMERA_DISPLAY_TEXT,
              style: TextStyle(
                  fontSize:
                  ScreenUtil().setSp(30, allowFontScalingSelf: true),
                  letterSpacing: 1.5),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, StringResource.GALLERY);
            },
            child: Text(
              StringResource.GALLERY_DISPLAY_TEXT,
              style: TextStyle(
                  fontSize:
                  ScreenUtil().setSp(30, allowFontScalingSelf: true),
                  letterSpacing: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}