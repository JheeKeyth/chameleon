//flutter imports
import 'package:flutter/material.dart';
//local imports
import 'package:google_fonts/google_fonts.dart';
//packages imports
import 'package:chameleon/screens/home/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: slider.length,
      allowImplicitScrolling: true,
      itemBuilder: (BuildContext context, int index) {
        return Image(
          image: AssetImage(slider[index]),
        );
      },
    );
  }
}
