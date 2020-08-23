//imports flutter
import 'package:chameleon/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//imports local
import 'package:chameleon/screens/home/widgets/constants.dart';
//imports packages
import 'package:google_fonts/google_fonts.dart';

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<DrawerMenu> {

  Texts texts = cameleon_texts(false);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title_app,
                style: GoogleFonts.oswald(fontSize: 45, color: Colors.white),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            'Informações',
            style: GoogleFonts.oswald(fontSize: 25),
          ),
        ),
        Divider(
          height: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: ListTile(
            title: Text(
              texts.menuText,
              style: GoogleFonts.roboto(fontSize: 18),
            ),
          ),
        ),
        ListTile(
          title: Row(
            children: [
              Icon(Icons.close),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sair',
                  style: GoogleFonts.roboto(fontSize: 18),
                ),
              ),
            ],
          ),
          onTap: () {
            //TODO: Deslogar da aplicação
          },
        ),
      ],
    );
  }
}
