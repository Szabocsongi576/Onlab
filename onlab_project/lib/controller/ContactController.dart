
import 'package:flutter/material.dart';
import 'package:onlabproject/view/ContactView.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactController extends StatefulWidget {
  @override
  _ContactControllerState createState() => _ContactControllerState();
}

class _ContactControllerState extends State<ContactController> implements IContactController {

  @override
  Widget build(BuildContext context) => ContactView(controller: this,);

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    } else {
      //TODO LAUNCH ERROR
      print("NOT LAUNCHED");
    }
  }

  @override
  Future<void> launchEmail(String email) async {
    print("EMAIL LAUNCHED");
    await _launchURL("mailto:" + email);
  }

  @override
  Future<void> launchFacebook(String fb) async {
    print("FB LAUNCHED");
    await _launchURL("https://" + fb);
  }

  @override
  Future<void> launchPhone(String tel) async {
    print("PHONE LAUNCHED");
    await _launchURL("tel:" + tel);
  }
}

abstract class IContactController {
  Future<void> launchEmail(String email);
  Future<void> launchPhone(String tel);
  Future<void> launchFacebook(String fb);
}