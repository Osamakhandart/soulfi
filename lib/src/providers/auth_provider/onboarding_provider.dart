import 'package:flutter/material.dart';
import 'package:soulfi/service/api_class.dart';
import 'package:soulfi/service/endpoints.dart';
import 'package:soulfi/service/error_handler.dart';
import 'package:soulfi/src/screens/auth/login.dart';
import 'package:soulfi/src/screens/auth/signup.dart';
import 'package:soulfi/src/screens/reset/get_email.dart';
import 'package:soulfi/src/screens/reset/new_password.dart';
import 'package:soulfi/src/widgets/custom_snackbar.dart';
import 'package:soulfi/utils/routes.dart';

class AuthProvider extends ChangeNotifier {
  ErrorHandler errorHandler = ErrorHandler();

  final ApiEndpoints apiEndpoints = ApiEndpoints();
  //login field
  TextEditingController loginUserName = TextEditingController();
  TextEditingController password = TextEditingController();

  //signup field
  TextEditingController signUpFirstName = TextEditingController();
  TextEditingController signUpLastName = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  ScreenType screenType = ScreenType.login;

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

  login(context) async {
    Map body = {
      "email": loginUserName.text,
      "password": password.text,
      "clientId": "16d78669-c473-40fe-a444-25c924858226"
    };

    var response = await Api().post(
        formData: body, url: apiEndpoints.login, auth: false, fromLogin: true);
    if (response != null && response.statusCode == 200) {
      Api().sp.write('token', response.data["access_token"]);
      loginUserName.clear();
      password.clear();
      Navigator.pushNamed(context, Routes.home);
    } else {
      print(response.data);
      ErrorHandler.handleError(response.data, context);
    }
  }

  signUp(context) async {
    Map body = {
      "resourceType": "Patient",
      "sendMail": false,
      "email": signUpEmail.text,
      "firstName": signUpFirstName.text,
      "lastName": 'test',
      "password": signUpPassword.text,
      "projectId": apiEndpoints.projectId,
      // "clientId": "16d78669-c473-40fe-a444-25c924858226"
    };

    var response = await Api().post(
        formData: body, url: apiEndpoints.signUp, auth: false, fromLogin: true);
    if (response != null && response.statusCode == 200) {
      Api().sp.write('token', response.data["access_token"]);
      signUpEmail.clear();
      signUpFirstName.clear();
      signUpLastName.clear();
      signUpPassword.clear();
      CustomBar.buildErrorSnackbar(context, "Account Created Successfully");
      Navigator.pushNamed(context, Routes.home);
    } else {
      print(response.data);
      ErrorHandler.handleError(response.data, context);
    }
  }

  Widget switchScreens() {
    switch (screenType) {
      case ScreenType.login:
        return Login();
      case ScreenType.signup:
        return Signup();

      case ScreenType.reset:
        return const ForgetPassword();

      case ScreenType.otp:
        return const ForgetPassword();

      case ScreenType.newPassword:
        return const NewPassword();
      default:
        return Container();
    }
  }

  changeScreenType(ScreenType type) {
    screenType = type;
    notifyListeners();
  }
}

enum ScreenType { login, signup, reset, otp, newPassword }
