import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlabproject/model/ObjectListItemData.dart';
import 'package:onlabproject/model/TransferFlowData.dart';

import '../Resource/StringResource.dart';
import 'components/MyBackground.dart';
import 'components/MyButton.dart';

class ObjectListView extends StatefulWidget {
  final TransferFlowData data;
  final Function onPageChanged;

  const ObjectListView({Key key, this.data, this.onPageChanged})
      : super(key: key);

  @override
  _ObjectListViewState createState() => _ObjectListViewState();
}

class _ObjectListViewState extends State<ObjectListView> {
  int _piece = 1;
  String _objectName;
  TextEditingController _teController = TextEditingController();
  FocusNode _node = FocusNode();

  @override
  void initState() {
    super.initState();

    widget.data.objectList.add(ObjectListItemData(name: "Kanapé"));
    widget.data.objectList.add(ObjectListItemData(name: "Ágy", piece: 6));
    widget.data.objectList.add(ObjectListItemData(name: "ASD", piece: 23));

    _teController.addListener(() {
      if (_teController.text.isEmpty) {
        _objectName = "";
      } else {
        _objectName = _teController.text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: MyBackground(
        child: Center(
          child: Container(
            width: ScreenUtil().setWidth(600),
            height: ScreenUtil.screenHeightDp,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildAddObject(),
                  _buildListView(),
                  _buildNextButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildAddObject() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            width: ScreenUtil().setWidth(290),
            height: ScreenUtil().setHeight(500),
            child: Stack(
              children: <Widget>[
                Center(
                  child: Icon(
                    Icons.image,
                  size: ScreenUtil().setWidth(80),
                  ),
                ),
                //TODO IMG
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(290),
            height: ScreenUtil().setHeight(500),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        StringResource.OLV_OBJECT_NAME_LABEL,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil()
                              .setSp(25, allowFontScalingSelf: true),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 0, 0, ScreenUtil().setHeight(50)),
                    child: TextField(
                      controller: _teController,
                      focusNode: _node,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        StringResource.OLV_PIECE_OF_OBJECT_LABEL,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil()
                              .setSp(25, allowFontScalingSelf: true),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {}, //TODO Counter
                        child: Padding(
                          padding: EdgeInsets.all(ScreenUtil().setHeight(10)),
                          child: Icon(
                            Icons.remove_circle_outline,
                            color: Colors.white,
                            size: ScreenUtil().setWidth(80),
                          ),
                        ),
                      ),
                      Text(
                        _piece.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil()
                              .setSp(50, allowFontScalingSelf: true),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {}, //TODO Counter
                        child: Padding(
                          padding: EdgeInsets.all(ScreenUtil().setHeight(10)),
                          child: Icon(
                            Icons.add_circle_outline,
                            color: Colors.white,
                            size: ScreenUtil().setWidth(80),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListView _buildListView() {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: widget.data.objectList.length,
      itemBuilder: (_, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(25)),
          child: Container(
            width: ScreenUtil().setWidth(600),
            height: ScreenUtil().setHeight(400),
            color: Color.fromARGB(255, 255, 220, 200),
            child: Padding(
              padding: EdgeInsets.all(ScreenUtil().setHeight(25)),
              child: Row(
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
                          Center(
                            child: Icon(Icons.image),
                          ),
                          //TODO IMG
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(20),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(300),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              StringResource.OLV_LIST_ITEM_NAME +
                                  widget.data.objectList[index].name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil()
                                    .setSp(30, allowFontScalingSelf: true),
                              ),
                            ),
                            Icon(
                              Icons.delete,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil().setWidth(20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              StringResource.OLV_LIST_ITEM_PIECE +
                                  widget.data.objectList[index].piece.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil()
                                    .setSp(30, allowFontScalingSelf: true),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _buildNextButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(50)),
      child: MyButton(
        width: ScreenUtil().setWidth(400),
        text: Text(
          StringResource.TF_NEXT_PAGE_BUTTON_TEXT,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(40, allowFontScalingSelf: true),
            color: Colors.white,
          ),
        ),
        onPressed: widget.onPageChanged,
      ),
    );
  }
}
