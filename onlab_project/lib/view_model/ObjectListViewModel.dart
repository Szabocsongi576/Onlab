import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:onlabproject/model/ObjectItemModel.dart';

part 'ObjectListViewModel.g.dart';

class ObjectListViewModel = _ObjectListViewModel with _$ObjectListViewModel;

abstract class _ObjectListViewModel with Store {
  ObservableList<ObjectItemModel> objectList = ObservableList<ObjectItemModel>();
  ObservableList<File> images = ObservableList<File>();

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
      images.add(image);
      objectList.add(ObjectItemModel(
          name: objectName,
          piece: piece,
      ));
      _reset();
    }
  }

  void removeListItem(int index) {
    objectList.removeAt(index);
    images.removeAt(index);
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

  _ObjectListViewModel() {
    controller.addListener(() {
      if (controller.text.isEmpty) {
        objectName = "";
      } else {
        objectName = controller.text;
        objectNameError = false;
      }
    });
  }
}