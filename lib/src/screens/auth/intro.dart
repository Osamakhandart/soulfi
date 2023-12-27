import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soulfi/src/providers/auth_provider/onboarding_provider.dart';
import 'package:soulfi/src/widgets/button.dart';
import 'package:soulfi/src/widgets/carousel.dart';
import 'package:soulfi/utils/routes.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final data = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              SizedBox(
                height: screenSize.height / 15,
              ),
              Image(
                height: screenSize.height / 28,
                image: const AssetImage("assets/images/logo.png"),
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: screenSize.height / 25,
              ),
              Container(
                height: screenSize.height / 1.8,
                width: screenSize.width,
                child: CustomCarousel(
                  imgList: data.introImages,
                  text: data.introText,
                ),
              ),
              Spacer(),
              CustomButton(
                text: 'Sign Up',
                onTap: () {
                  Navigator.pushNamed(context, Routes.signup);
                },
              ),
              SizedBox(
                height: screenSize.height / 70,
              ),
              CustomButton(
                text: 'Sign In',
                btnColor: Colors.white,
                isBorder: true,
                onTap: () {
                  Navigator.pushNamed(context, Routes.login);
                },
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
