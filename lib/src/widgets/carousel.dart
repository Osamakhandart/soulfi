import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:soulfi/utils/color_file.dart';
import 'package:soulfi/utils/text_styling.dart';

class CustomCarousel extends StatefulWidget {
  CustomCarousel({required this.imgList, required this.text});
  List? imgList;
  List<String> text;
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CustomCarousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        CarouselSlider(
          items: List.generate(
            widget.imgList!.length,
            (index) => Container(
              child: Stack(
                children: <Widget>[
                  Image(
                    height: screenSize.height / 1.3,
                    image: AssetImage(widget.imgList![index]),
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
          ),
          carouselController: _controller,
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height / 1.5,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Spacer(),
        Container(
          // height: screenSize.height / 10,
          child: Text(widget.text[_current],
              textAlign: TextAlign.center,
              style: poppins(
                color: Colors.black,
              )),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imgList!.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                  width: ResponsiveBreakpoints.of(context).isMobile
                      ? screenSize.width / 7
                      : screenSize.width / 25,
                  height: 10.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: _current != entry.key
                          ? DynamicColor.grey
                          : DynamicColor.primary)),
            );
          }).toList(),
        ),
        Spacer()
      ],
    );
  }
}
