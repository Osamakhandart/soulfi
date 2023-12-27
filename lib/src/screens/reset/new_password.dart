import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:soulfi/src/providers/auth_provider/onboarding_provider.dart';
import 'package:soulfi/src/widgets/button.dart';
import 'package:soulfi/src/widgets/textfield.dart';
import 'package:soulfi/utils/color_file.dart';
import 'package:soulfi/utils/routes.dart';
import 'package:soulfi/utils/text_styling.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final provider = Provider.of<AuthProvider>(context);
    return Scaffold(
        backgroundColor: DynamicColor.whiteColor,
        body: Container(
            height: screenSize.height,
            width: screenSize.width,
            child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenSize.height / 15,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Center the children horizontally
                          children: [
                            InkWell(
                                onTap: () {
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
                                child: Icon(Icons.arrow_back_ios)),
                            const Spacer(), // Create space between the icon and the text
                            Text(
                              "Reset Password",
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
                      SizedBox(
                        height: screenSize.height / 25,
                      ),
                      Text(
                        "New Password",
                        style: poppins(
                            fontSize: screenSize.height / 55,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: screenSize.height / 50,
                      ),
                      CustomTextField(
                        hint: 'Enter new password',
                      ),
                      SizedBox(
                        height: screenSize.height / 20,
                      ),
                      Text(
                        "Confirm",
                        style: poppins(
                            fontSize: screenSize.height / 55,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: screenSize.height / 50,
                      ),
                      CustomTextField(
                        hint: 'Confirm password',
                      ),
                      SizedBox(
                        height: screenSize.height / 13,
                      ),
                      Center(
                        child: CustomButton(
                          text: 'Send',
                          onTap: () {
                            if (ResponsiveBreakpoints.of(context).isMobile) {
                              Navigator.pushNamed(context, Routes.signup);
                            } else {
                              provider.changeScreenType(ScreenType.login);
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height / 20,
                      ),
                    ]))));
  }
}
