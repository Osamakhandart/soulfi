import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soulfi/src/providers/auth_provider/onboarding_provider.dart';
import 'package:soulfi/src/widgets/carousel.dart';
import 'package:soulfi/utils/color_file.dart';

class WebAuthScreen extends StatefulWidget {
  const WebAuthScreen({super.key});

  @override
  _WebAuthScreenState createState() => _WebAuthScreenState();
}

class _WebAuthScreenState extends State<WebAuthScreen>
    with SingleTickerProviderStateMixin {
  var tweenLeft =
      Tween<Offset>(begin: const Offset(2, 0), end: const Offset(0, 0))
          .chain(CurveTween(curve: Curves.ease));
  var tweenRight =
      Tween<Offset>(begin: const Offset(0, 0), end: const Offset(2, 0))
          .chain(CurveTween(curve: Curves.ease));

  AnimationController? _animationController;

  bool isChecked = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 2,
                color: Colors.white,
                child: CustomCarousel(
                  imgList: data.introImages,
                  text: data.introText,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 2,
                color: DynamicColor.primary,
                child: Center(
                  child: Card(
                    elevation: 5,
                    margin: const EdgeInsets.all(0),
                    color: DynamicColor.whiteColor,
                    child: Container(
                        decoration: BoxDecoration(
                            color: DynamicColor.whiteColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        width: MediaQuery.of(context).size.width / 3.6,
                        height: MediaQuery.of(context).size.height / 1.12,
                        child: data.switchScreens()
                        //Login()
                        // data.webLogin ? Login() : const Signup()
                        ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
