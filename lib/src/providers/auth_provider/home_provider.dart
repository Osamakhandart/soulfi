import 'package:flutter/material.dart';
import 'package:soulfi/service/api_class.dart';
import 'package:soulfi/service/endpoints.dart';

class HomeProvider extends ChangeNotifier {
  final ApiEndpoints apiEndpoints = ApiEndpoints();
  //login field
  TextEditingController loginUserName = TextEditingController();
  TextEditingController password = TextEditingController();

  //signup field
  TextEditingController signUpFirstName = TextEditingController();
  TextEditingController signUpLastName = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();

  List<String> introText = [
    "Whenever and wherever\n you need us, \nwe are there for you!",
    "Embark on a soulful journey -\n Dive into Soulfi today"
  ];
  List<String> introImages = [
    "assets/images/introscreenfirst.png",
    "assets/images/intro.png",
  ];

  Map body = {
    "email": "osamakashif5678@gmail.com",
    "password": "Begin123",
    "clientId": "16d78669-c473-40fe-a444-25c924858226"
  };

  login() async {
    Map body = {
      "email": loginUserName.text,
      "password": password.text,
      "clientId": "16d78669-c473-40fe-a444-25c924858226"
    };

    var response = await Api().post(
        formData: body, url: apiEndpoints.login, auth: false, fromLogin: true);
    if (response != null && response.statusCode == 200) {
    } else {}
  }

  signUp() async {
    Map body = {
      "resourceType": "Patient",
      "sendMail": true,
      "email": "usamakashif98@icloud.com",
      "firstName": "TU",
      "lastName": "test",
      "password": "Begin123",
      "projectId": "849f8a23-7950-47a8-b93f-31f730871f04"
    };

    var response = await Api().post(
        formData: body, url: apiEndpoints.login, auth: false, fromLogin: true);
    if (response != null && response.statusCode == 200) {
    } else {}
  }
}
