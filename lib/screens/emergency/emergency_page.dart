//imports flutter
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//imports local
import 'package:chameleon/screens/home/widgets/buttom_custom.dart';

//imports packages
import 'package:google_fonts/google_fonts.dart';
import 'package:chameleon/model/Contact.dart';

class EmergencyPage extends StatefulWidget {
  @override
  _EmergencyPageState createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  List list = List<Contact>();

  addContact(Contact contact) {
    this.list.add(contact);
    cleanDialog();
  }

  deleteContact(int index){
    this.list.removeAt(index);
  }

  cleanDialog() {
    nameController.text = "";
    phoneController.text = "";
  }

  showAlertDialog2(BuildContext context) {
    Widget cancelaButton = FlatButton(
      child: Text("Cancelar"),
      onPressed: Navigator.of(context).pop,
    );
    Widget continuaButton = FlatButton(
      child: Text("Continar"),
      onPressed: () {
        addContact(new Contact(
            name: nameController.text, phone: phoneController.text));
        Navigator.pop(context);
      },
    );
    //configura o AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Adicionar novo contato"),
      content: Form(
        key: _formKey,
        child: Container(
          width: 260.0,
          height: 150.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  decoration: InputDecoration(hintText: "Nome"),
                  validator: (value) {
                    if (value.isEmpty) return 'Digite o nome';
                    return null;
                  }),
              TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  decoration: InputDecoration(hintText: "Telefone"),
                  validator: (value) {
                    if (value.isEmpty) return 'Digite o número';
                    return null;
                  })
            ],
          ),
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
        return Container(
          child: alert,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Emergência',
            style: GoogleFonts.oswald(
              textStyle: TextStyle(fontSize: 24, letterSpacing: 1.5),
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFFCFA181),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 35, horizontal: 35),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: this.list.length,
                    itemBuilder: (BuildContext context, index) {
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ButtomCustom(
                                text: this.list[index].name,
                                textColor: Colors.white,
                                backgroundColor: Color(0xFFCFA181),
                                icon: Icons.person,
                                onClick: () {
                                  print("texto");
                                }),
                            IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.redAccent,
                              ),
                              onPressed: (){
                                setState(() {
                                  deleteContact(index);
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    }),
                ButtomCustom(
                    text: 'Novo contato',
                    textColor: Colors.white,
                    backgroundColor: Color(0xFF9D7254),
                    icon: Icons.person_add,
                    onClick: () {
                      showAlertDialog2(context);
                    })
              ],
            ),
          ),
        ));
  }
}
