import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:soulfi/src/providers/auth_provider/onboarding_provider.dart';
import 'package:soulfi/src/widgets/button.dart';
import 'package:soulfi/src/widgets/textfield.dart';
import 'package:soulfi/utils/color_file.dart';
import 'package:soulfi/utils/routes.dart';
import 'package:soulfi/utils/text_styling.dart';

class Signup extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final provider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: DynamicColor.whiteColor,
      body: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResponsiveBreakpoints.of(context).isMobile
                      ? SizedBox(
                          height: screenSize.height / 15,
                        )
                      : SizedBox(
                          height: screenSize.height / 40,
                        ),
                  // Center(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment
                  //         .center, // Center the children horizontally
                  //     children: [
                  //       const Icon(Icons.arrow_back_ios),
                  //       const Spacer(), // Create space between the icon and the text
                  //       Text(
                  //         "Sign Up",
                  //         style: poppins(
                  //           color: DynamicColor.primary,
                  //           fontSize: screenSize.height / 32,
                  //         ),
                  //       ),
                  //       const Spacer(),
                  //       const SizedBox(
                  //         width: 20,
                  //       )
                  //     ],
                  //   ),
                  // ),
                  ResponsiveBreakpoints.of(context).isMobile
                      ? Center(
                          child: SizedBox(
                            width: screenSize.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Center the children horizontally
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        Routes
                                            .login, // The route to navigate to
                                        (route) =>
                                            false, // This condition ensures that all previous routes are removed
                                      );
                                    },
                                    child: Icon(Icons.arrow_back_ios)),
                                const Spacer(), // Create space between the icon and the text
                                Text(
                                  "Sign Up",
                                  style: poppins(
                                    color: DynamicColor.primary,
                                    fontSize: screenSize.height / 32,
                                  ),
                                ),
                                const Spacer(),
                                const SizedBox(
                                  width: 20,
                                )
                              ],
                            ),
                          ),
                        )
                      : Center(
                          child: Image.asset("assets/images/logo.png",
                              scale: 3.5)),
                  SizedBox(
                    height: ResponsiveBreakpoints.of(context).isMobile
                        ? screenSize.height / 35
                        : screenSize.height / 35,
                  ),
                  Text(
                    "Name",
                    style: poppins(
                        fontSize: screenSize.height / 55, color: Colors.black),
                  ),
                  SizedBox(
                    height: screenSize.height / 60,
                  ),
                  SizedBox(
                    height: screenSize.height / 18,
                    child: CustomTextField(
                      hint: 'Enter your name',
                      controller: provider.signUpFirstName,
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height / 25,
                  ),
                  Text(
                    "Email*",
                    style: poppins(
                        fontSize: screenSize.height / 55, color: Colors.black),
                  ),
                  SizedBox(
                    height: screenSize.height / 60,
                  ),
                  SizedBox(
                    height: screenSize.height / 18,
                    child: CustomTextField(
                      controller: provider.signUpEmail,
                      isEmail: true,
                      hint: 'name@mail.com',
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height / 25,
                  ),
                  Text(
                    "Password*",
                    style: poppins(
                        fontSize: screenSize.height / 55, color: Colors.black),
                  ),
                  SizedBox(
                    height: screenSize.height / 60,
                  ),
                  SizedBox(
                    height: screenSize.height / 18,
                    child: CustomTextField(
                      controller: provider.signUpPassword,
                      hint: '**********',
                    ),
                  ),
                  ResponsiveBreakpoints.of(context).isMobile
                      ? SizedBox(
                          height: screenSize.height / 9,
                        )
                      : SizedBox(
                          height: screenSize.height / 16,
                        ),
                  // const Spacer(),
                  Center(
                    child: CustomButton(
                      text: 'Sign Up',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          provider.signUp(context);
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height / 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: ResponsiveBreakpoints.of(context).isMobile
                            ? screenSize.width / 3
                            : screenSize.width / 12,
                        height: 1,
                        color: Colors.black,
                      ),
                      const Spacer(),
                      const Center(child: Text('or')),
                      const Spacer(),
                      Container(
                        width: ResponsiveBreakpoints.of(context).isMobile
                            ? screenSize.width / 3
                            : screenSize.width / 12,
                        height: 1,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height / 20,
                  ),
                  Center(
                    child: CustomButton(
                      prefixIcon: const Image(
                        height: 30,
                        width: 30,
                        image: AssetImage(
                          "assets/images/google.png",
                        ),
                      ),
                      text: ' Continue with Google',
                      // width: screenSize.width,
                      btnColor: Colors.white,
                      isBorder: true,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          provider.signUp(context);
                        }
                        Navigator.pushNamed(context, Routes.login);
                      },
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height / 60,
                  ),
                  Center(
                    child: CustomButton(
                      prefixIcon: const Image(
                        height: 25,
                        width: 25,
                        image: AssetImage(
                          "assets/images/apple.png",
                        ),
                      ),
                      text: ' Continue with Apple',
                      // width: screenSize.width,
                      btnColor: Colors.black, textColor: Colors.white,
                      isBorder: true,
                      onTap: () {
                        Navigator.pushNamed(context, Routes.login);
                      },
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height / 70,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: poppins(),
                        children: [
                          TextSpan(
                            text: 'Already have an account? ',
                            style: poppins(
                                underline: false,
                                fontSize: screenSize.height / 65,
                                color: DynamicColor.black),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                if (ResponsiveBreakpoints.of(context)
                                    .isMobile) {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    Routes.login, // The route to navigate to
                                    (route) =>
                                        false, // This condition ensures that all previous routes are removed
                                  );
                                } else {
                                  provider.changeScreenType(ScreenType.login);
                                }
                              },
                            text: 'Sign In',
                            style: poppins(
                                underline: false,
                                fontSize: screenSize.height / 65,
                                color: DynamicColor.primary),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: screenSize.height / 18,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
