import 'package:chameleon/screens/login/constants.dart';
import 'package:chameleon/screens/login/widgets/custom_button.dart';
import 'package:chameleon/screens/login/widgets/custom_input_field.dart';
import 'package:chameleon/screens/login/widgets/fade_slide_transition.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  final Animation<double> animation;

  const RegisterForm({
    @required this.animation
  }) : assert(animation != null);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var space = height > 650 ? kSpaceM : kSpaceS;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
      child: Column(
        children: <Widget>[
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 0.0,
            child: CustomInputField(
              label: 'Nome',
              prefixIcon: Icons.person,
              obscureText: true,
            ),
          ),
          SizedBox(height: space),
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
            additionalOffset: space,
            child: CustomInputField(
              label: 'Confirmar Senha',
              prefixIcon: Icons.lock,
              obscureText: true,
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: space,
            child: CustomInputField(
              label: 'CRP/OAB/Endereço',
              prefixIcon: Icons.verified_user,
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
              onPressed: () {},
            ),
          ),
          SizedBox(height: space),
          InkWell(
            child: FadeSlideTransition(
              animation: animation,
              additionalOffset: 0.0,
              child: Text(
                'Termos de adesão',
              ),
            ),
            onTap: () {
              _showMyDialog(context, animation);
            },
          )
        ],
      ),
    );
  }
}

Future<void> _showMyDialog(
    BuildContext context, Animation<double> animation) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Termos de contrato'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Segundo a lei, e lá vai bolinha ...'),
              Text('Para continuar, aceite os termos.'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Aceitar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
