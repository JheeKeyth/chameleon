import 'package:chameleon/screens/home/home.dart';
import 'package:chameleon/screens/login/widgets/custom_input_field.dart';
import 'package:chameleon/screens/register/register.dart';
import 'package:chameleon/screens/terms/terms_of_use.dart';
import 'package:flutter/material.dart';
import 'package:chameleon/screens/login/constants.dart';
import 'package:chameleon/screens/login/widgets/custom_button.dart';
import 'package:chameleon/screens/login/widgets/fade_slide_transition.dart';
import 'package:flutter/foundation.dart';

class LoginForm extends StatelessWidget {
  final Animation<double> animation;

  const LoginForm({
    @required this.animation
  }) : assert(animation != null);

  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height;
    var space = height > 650 ? kSpaceM : kSpaceS;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
      child: Column(
        children: <Widget>[
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 0.0,
            child: CustomInputField(
              label: 'CPF',
              prefixIcon: Icons.person,
              obscureText: true,
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: space,
            child: CustomInputField(
              label: 'Senha',
              prefixIcon: Icons.lock,
              obscureText: true,
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 2 * space,
            child: CustomButton(
              color: kBlue,
              textColor: kWhite,
              text: 'Entrar',
              onPressed: () {
                //TODO: Fazer autenticação
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Home();
                    },
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 2 * space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 3 * space,
            child: CustomButton(
              color: kWhite,
              textColor: kBlack.withOpacity(0.5),
              text: 'Entrar com Google',
              image: Image(
                image: AssetImage(kGoogleLogoPath),
                height: 48.0,
              ),
              onPressed: () {
                //TODO: Fazer autenticação

                //First login only
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return TermsOfUses();
                    },
                  ),
                );
              },
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 4 * space,
            child: CustomButton(
              color: kBlack,
              textColor: kWhite,
              text: 'Crie uma conta',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Register();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
