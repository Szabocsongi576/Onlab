import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlabproject/page_data/TransferFlowData.dart';
import 'package:onlabproject/view/components/MyForm.dart';

import '../Resource/StringResource.dart';
import 'components/MyBackground.dart';
import 'components/MyButton.dart';

class ConnectionDataView extends StatelessWidget {
  final TransferFlowData data;
  final Function onPageChanged;

  const ConnectionDataView({this.data, this.onPageChanged});

  _nextPage() {
    if(data.useProfileData || data.formData.validate()) {
      onPageChanged();
    } else {
      //TODO error snackbar
    }
  }

  /*bool _validate() {
    String firstName = data.formData.firstName;
    String lastName = data.formData.lastName;
    String postalCode = data.formData.postalCode;
    String city = data.formData.city;
    String streetAndNum = data.formData.streetAndNum;
    String countryCode = data.formData.countryCode;
    String tel = data.formData.tel;

    if(firstName == null || firstName.length == 0) {
      data.formData.firstNameError = true;
    }
    if(lastName == null || lastName.length == 0) {
      data.formData.lastNameError = true;
    }
    if(postalCode == null || postalCode.length == 0) {
      data.formData.postalCodeError = true;
    }
    if(city == null || city.length == 0) {
      data.formData.cityError = true;
    }
    if(streetAndNum == null || streetAndNum.length == 0) {
      data.formData.streetAndNumError = true;
    }
    if(countryCode == null || countryCode.length == 0) {
      data.formData.countryCodeError = true;
    }
    if(tel == null || tel.length < 6) {
      data.formData.telError = true;
    }

    return !data.formData.isError();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: MyBackground(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                  width: ScreenUtil().setWidth(600),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Theme(
                        data: ThemeData(
                          unselectedWidgetColor: Colors.white,
                        ),
                        child: Observer(
                          builder: (_) => Checkbox(
                            value: data.useProfileData,
                            activeColor: Color.fromARGB(255, 255, 115, 0),
                            checkColor: Colors.white,
                            onChanged: (bool value) {
                              data.useProfileData = value;
                            },
                          ),
                        ),
                      ),
                      Text(
                        StringResource.CDV_USE_PROFILE_DATA_CB_TEXT,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil()
                                .setSp(35, allowFontScalingSelf: true)),
                      ),
                    ],
                  ),
                ),
              ),
              Observer(
                builder: (_) => MyForm(
                  data: data.formData,
                  enableFields: !data.useProfileData,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    0, 0, 0, ScreenUtil().setHeight(50)),
                child: MyButton(
                  width: ScreenUtil().setWidth(400),
                  text: Text(
                    StringResource.TF_NEXT_PAGE_BUTTON_TEXT,
                    style: TextStyle(
                      fontSize: ScreenUtil()
                          .setSp(40, allowFontScalingSelf: true),
                      color: Colors.white,
                    ),
                  ),
                  onPressed: _nextPage,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
