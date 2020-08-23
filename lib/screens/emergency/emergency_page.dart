//imports flutter
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//imports local
import 'package:chameleon/screens/home/widgets/buttom_custom.dart';
//imports packages
import 'package:google_fonts/google_fonts.dart';

class EmergencyPage extends StatefulWidget {
  @override
  _EmergencyPageState createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ('Emergência', style: GoogleFonts.oswald(
          textStyle: TextStyle(fontSize: 24, letterSpacing: 1.5),
        ),),
        centerTitle: true,
        backgroundColor: Color(0xFFCFA181),

        leading:   new IconButton(

          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(null),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 48),

            ButtomCustom(
                text: 'Polícia Federal',
                textColor: Colors.white,
                backgroundColor: Color(0xFFCFA181),
                icon: Icons.person,
                onClick: () {print("texto");}

            ),
            ButtomCustom(
                text: 'Delegacia da Mulher',
                textColor: Colors.white,
                backgroundColor: Color(0xFFCFA181),
                icon: Icons.person,
                onClick: () {print("texto");}

            ),
            ButtomCustom(
                text: 'Samu',
                textColor: Colors.white,
                backgroundColor: Color(0xFFCFA181),
                icon: Icons.person,
                onClick: () {print("texto");}

            ),
            ButtomCustom(
                text: 'Samu',
                textColor: Colors.white,
                backgroundColor: Color(0xFF9D7254),
                icon: Icons.person_add,
                onClick: () {print("texto");}

            ),

            //fim botao mais contatos
          ],
        ),
      ),
    );
  }
}
