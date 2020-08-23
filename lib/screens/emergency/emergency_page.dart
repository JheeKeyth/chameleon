//imports flutter
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//imports local
import 'package:chameleon/screens/home/widgets/buttom_custom.dart';
//imports packages
import 'package:google_fonts/google_fonts.dart';

showAlertDialog2(BuildContext context) {

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  Widget cancelaButton = FlatButton(
    child: Text("Cancelar"),
    onPressed: Navigator.of(context).pop ,
  );
  Widget continuaButton = FlatButton(
    child: Text("Continar"),
    onPressed:  () {},
  );
  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Adicionar novo contato"),
    content: Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.name,
            controller: nameController,
            decoration: InputDecoration(hintText: "Nome"),
            validator: (value) {
              if (value.isEmpty) return 'Digite o nome';
              return null;
            }
          ),
          TextFormField(
            keyboardType: TextInputType.phone,
            controller: phoneController,
            decoration: InputDecoration(hintText: "Telefone"),
            validator: (value) {
              if (value.isEmpty) return 'Digite o número';
              return null;
            }
          )
        ],
      ),
    ),
    actions: [
      cancelaButton,
      continuaButton,
    ],
  );
  //exibe o diálogo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

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
                text: 'Novo contato',
                textColor: Colors.white,
                backgroundColor: Color(0xFF9D7254),
                icon: Icons.person_add,
                onClick: showAlertDialog2(context)

            ),

            //fim botao mais contatos
          ],
        ),
      ),
    );
  }
}


