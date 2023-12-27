import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soulfi/src/providers/auth_provider/home_provider.dart';
import 'package:soulfi/utils/color_file.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final data = Provider.of<HomeProvider>(context);
    return Scaffold(
      backgroundColor: DynamicColor.whiteColor,
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        child: const Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
