import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:onlabproject/Resource/StringResource.dart';
import 'package:onlabproject/model/ObjectItemModel.dart';
import 'package:transparent_image/transparent_image.dart';

class ObjectListItemView extends StatelessWidget {
  final ObjectItemModel data;
  final File image;
  final Function onRemove;
  final bool imageFromURL;

  const ObjectListItemView({
    Key key,
    @required this.data,
    this.onRemove,
    this.image,
    this.imageFromURL = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(600),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 220, 200),
        boxShadow: [
          (onRemove != null)
              ? BoxShadow(
                  color: Colors.black54,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(2, 2), // changes position of shadow
                )
              : BoxShadow(),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setHeight(25)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(230),
              height: ScreenUtil().setHeight(400),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Center(child: Icon(Icons.image)),
                    (imageFromURL)
                        ? Container(
                            width: ScreenUtil().setWidth(230),
                            height: ScreenUtil().setHeight(400),
                            child: FadeInImage.memoryNetwork(
                              fit: BoxFit.cover,
                              image: data.imageURL,
                              placeholder: kTransparentImage,
                            ),
                          )
                        : Container(),
                    (image != null)
                        ? Container(
                            width: ScreenUtil().setWidth(230),
                            height: ScreenUtil().setHeight(400),
                            child: Image.file(
                              image,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(50),
            ),
            Container(
              width: ScreenUtil().setWidth(320),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 0, 0, ScreenUtil().setHeight(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          StringResource.OLV_LIST_ITEM_NAME,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: ScreenUtil()
                                  .setSp(40, allowFontScalingSelf: true),
                              fontWeight: FontWeight.bold),
                        ),
                        (onRemove != null)
                            ? GestureDetector(
                                onTap: onRemove,
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.black,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(20), 0,
                        ScreenUtil().setWidth(50), ScreenUtil().setHeight(30)),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        data.name,
                        //overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil()
                              .setSp(35, allowFontScalingSelf: true),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 0, 0, ScreenUtil().setHeight(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          StringResource.OLV_LIST_ITEM_PIECE,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: ScreenUtil()
                                  .setSp(40, allowFontScalingSelf: true),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 0, 0, ScreenUtil().setHeight(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              ScreenUtil().setWidth(20), 0, 0, 0),
                          child: Text(
                            data.piece.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: ScreenUtil()
                                  .setSp(35, allowFontScalingSelf: true),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
