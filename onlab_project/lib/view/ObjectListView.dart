import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlabproject/view/components/MyTextField.dart';
import 'package:onlabproject/view/components/TransferFlowPage.dart';
import 'package:onlabproject/service/MyImageLoadService.dart';
import 'package:onlabproject/page_data/ObjectListViewModel.dart';
import 'package:onlabproject/view/components/CameraGalleryDialog.dart';
import 'package:onlabproject/view/components/MyButton.dart';
import 'package:onlabproject/view/components/ObjectListItemView.dart';

import '../Resource/StringResource.dart';

class ObjectListView extends StatelessWidget {
  final ObjectListViewModel viewModel;
  final Function onNextPage;
  final Function onPreviousPage;

  ObjectListView(
      {@required this.viewModel,
      @required this.onNextPage,
      @required this.onPreviousPage});

  Future<void> _loadImage(BuildContext context) async {
    var dialogResult = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CameraGalleryDialog();
        });
    viewModel.image = await MyImageLoadService.loadImage(dialogResult);
  }

  @override
  Widget build(BuildContext context) {
    return TransferFlowPage(
      title: StringResource.OLV_TITLE,
      onBackArrowTap: onPreviousPage,
      onForwardArrowTap: onNextPage,
      onBackgroundTap: viewModel.node.unfocus,
      pageIndex: 1,
      child: Column(
        children: <Widget>[
          _buildAddObject(context),
          _buildListView(),
          //_buildNextButton(),
        ],
      ),
    );
  }

  Widget _buildAddObject(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(50), 0, 0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _loadImage(context);
                  },
                  child: Observer(
                    builder: (_) => Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      width: ScreenUtil().setWidth(300),
                      height: ScreenUtil().setHeight(500),
                      child: viewModel.image == null
                          ? Center(
                              child: Icon(
                                Icons.image,
                                size: ScreenUtil().setWidth(80),
                              ),
                            )
                          : Image.file(
                              viewModel.image,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(330),
                  height: ScreenUtil().setHeight(500),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          StringResource.OLV_OBJECT_NAME_LABEL,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil()
                                .setSp(25, allowFontScalingSelf: true),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, 0, 0, ScreenUtil().setHeight(50)),
                          child: Observer(
                            builder: (_) => MyTextField(
                                controller: viewModel.controller,
                                focusNode: viewModel.node,
                                isError: viewModel.objectNameError,
                                keyboardType: TextInputType.multiline,
                                maxLines: 3,
                                errorText:
                                    StringResource.FORM_FIELD_ERROR_TEXT),
                          ),
                        ),
                        Text(
                          StringResource.OLV_PIECE_OF_OBJECT_LABEL,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil()
                                .setSp(25, allowFontScalingSelf: true),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                if (viewModel.piece != 1) viewModel.piece--;
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.all(ScreenUtil().setHeight(10)),
                                child: Icon(
                                  Icons.remove_circle_outline,
                                  color: Colors.white,
                                  size: ScreenUtil().setWidth(80),
                                ),
                              ),
                            ),
                            Observer(
                              builder: (_) => Text(
                                viewModel.piece.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenUtil()
                                      .setSp(50, allowFontScalingSelf: true),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                viewModel.piece++;
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.all(ScreenUtil().setHeight(10)),
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyButton(
                onPressed: viewModel.addListItem,
                width: ScreenUtil().setWidth(400),
                text: Text(
                  StringResource.OLV_ADD_TO_LIST_BUTTON_TEXT,
                  style: TextStyle(
                    fontSize:
                        ScreenUtil().setSp(35, allowFontScalingSelf: true),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildListView() {
    return Observer(
      builder: (_) => ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: viewModel.objectList.length,
        itemBuilder: (_, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(25)),
            child: ObjectListItemView(
              data: viewModel.objectList[index],
              image: viewModel.images[index],
              onRemove: () {
                viewModel.removeListItem(index);
              },
            ),
          );
        },
      ),
    );
  }
}
