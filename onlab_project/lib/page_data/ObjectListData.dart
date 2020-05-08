import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:onlabproject/model/ObjectItemModel.dart';

part 'ObjectListData.g.dart';

class ObjectListData = _ObjectListData with _$ObjectListData;

abstract class _ObjectListData with Store {
  ObservableList<ObjectItemModel> objectList = ObservableList<ObjectItemModel>();

  @observable
  File image;

  @observable
  int piece = 1;

  @observable
  String objectName;

  @observable
  bool objectNameError = false;

  TextEditingController controller = TextEditingController();
  FocusNode node = FocusNode();

  void addListItem() {
    if(_validate()) {
      objectList.add(ObjectItemModel(
          name: objectName,
          piece: piece,
          image: image
      ));
      _reset();
    }
  }

  void removeListItem(int index) {
    objectList.removeAt(index);
  }

  void _reset() {
    controller.text = "";
    node.unfocus();
    piece = 1;
    image = null;
  }

  bool _validate() {
    if(objectName == null || objectName == "")
      objectNameError = true;
    return !objectNameError;
  }

  _ObjectListData() {
    controller.addListener(() {
      if (controller.text.isEmpty) {
        objectName = "";
      } else {
        objectName = controller.text;
        objectNameError = false;
        print(objectNameError);
      }
    });

    objectList.add(ObjectItemModel(name: "Kanapé"));
    objectList.add(ObjectItemModel(name: "Ágyaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", piece: 6));
    objectList.add(ObjectItemModel(name: "aaaaaaaaa sssssssss ddddddddd", piece: 23));
  }
}