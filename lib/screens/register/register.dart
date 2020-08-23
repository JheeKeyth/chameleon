import 'package:chameleon/screens/login/constants.dart';
import 'package:chameleon/screens/login/widgets/fade_slide_transition.dart';
import 'package:chameleon/screens/register/widgets/register_form.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  final double screenHeight;

  const Register({
    @required this.screenHeight
  }) : assert(screenHeight != null);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _formElementAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: kLoginAnimationDuration,
    );

    var fadeSlideTween = Tween<double>(begin: 0.0, end: 1.0);
    _formElementAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.7,
        1.0,
        curve: Curves.easeInOut,
      ),
    ));

    var clipperOffsetTween = Tween<double>(
      begin: widget.screenHeight,
      end: 0.0,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kWhite,
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: kPaddingL),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FadeSlideTransition(
                  animation: _formElementAnimation,
                  additionalOffset: 0.0,
                  child: Text(
                    'Chameleon',
                    style: GoogleFonts.oswald(
                      fontSize: 50,
                      color: Colors.white,
                      textStyle: TextStyle(
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black38,
                              offset: Offset(4.0, 3.0),
                            ),
                          ]
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: RegisterForm(
                    animation: _formElementAnimation,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

