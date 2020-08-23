import 'package:flutter/material.dart';
import 'package:chameleon/screens/login/constants.dart';
import 'package:chameleon/screens/login/widgets/fade_slide_transition.dart';
import 'package:chameleon/screens/login/widgets/login_form.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  final double screenHeight;

  const Login({
    @required this.screenHeight,
  }) : assert(screenHeight != null);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
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
    return WillPopScope(
      onWillPop: (){
        return null;
      },
      child: Scaffold(
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
                    additionalOffset: 0,
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 96,
                      height: 96,
                    ),
                  ),
                  FadeSlideTransition(
                    animation: _formElementAnimation,
                    additionalOffset: 0.0,
                    child: Text(
                      'Chameleon',
                      style: GoogleFonts.oswald(
                        fontSize: 50,
                        color: Theme.of(context).primaryColor,
                        textStyle: TextStyle(
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black12,
                              offset: Offset(4.0, 3.0),
                            ),
                          ]
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: LoginForm(
                      animation: _formElementAnimation,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

