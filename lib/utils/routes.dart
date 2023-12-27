import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:soulfi/src/screens/auth/auth_web/login_web.dart';
import 'package:soulfi/src/screens/auth/intro.dart';
import 'package:soulfi/src/screens/auth/login.dart';
import 'package:soulfi/src/screens/auth/signup.dart';
import 'package:soulfi/src/screens/dashboard/home.dart';
import 'package:soulfi/src/screens/reset/get_email.dart';
import 'package:soulfi/src/screens/reset/new_password.dart';

class Routes {
  static const String intro = '/intro';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String reset = '/reset';
  static const String newPassword = '/newPassword';
  static const String home = '/home';

  static final Map<String, WidgetBuilder> routes = {
    intro: (context) => ResponsiveBreakpoints.of(context).isMobile
        ? const Introduction()
        : WebAuthScreen(),
    login: (context) =>
        ResponsiveBreakpoints.of(context).isMobile ? Login() : WebAuthScreen(),
    signup: (context) => Signup(),
    reset: (context) => const ForgetPassword(),

    newPassword: (context) => const NewPassword(),
    home: (context) => Home(),
    // Add other routes as needed
  };
}
