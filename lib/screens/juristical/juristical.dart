import 'package:flutter/material.dart';

class JuristicalPage extends StatefulWidget {
  @override
  _JuristicalPageState createState() => _JuristicalPageState();
}

class _JuristicalPageState extends State<JuristicalPage> {
  String nomeCidade = "";
  var _cidades = [
    'Acre',
    'Alagoas',
    'Amapá',
    'Amazonas',
    'Bahia',
    'Ceará',
    'Distrito Federal',
    'Espírito Santo',
    'Goías',
    'Maranhão',
    'Mato Grosso',
    'Mato Grosso do Sul',
    'Minas Gerais',
    'Pará',
    'Paraíba',
    'Paraná',
    'Pernambuco',
    'Piauí',
    'Rio de Janeiro',
    'Rio Grande do Norte',
    'Rio Grande do Sul',
    'Rondônia',
    'Roraíma',
    'Santa Catarina',
    'São Paulo',
    'Sergipe',
    'Tocantins'
  ];
  var _itemSelecionado = 'Acre';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Advogados"),
        leading: IconButton(
            tooltip: 'Voltar',
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Color.fromRGBO(158, 100, 134, .7),
      ),
      body: criaDropDownButton(),
    );
  }

  criaDropDownButton() {
    return Container(
      padding: EdgeInsets.all(20.0),
      width: 1000,
      child: Column(
        children: <Widget>[
          DropdownButton<String>(
              items: _cidades.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (String novoItemSelecionado) {
                _dropDownItemSelected(novoItemSelecionado);
                setState(() {
                  this._itemSelecionado = novoItemSelecionado;
                });
              },
              value: _itemSelecionado),
          Expanded(
              child: SizedBox(
                width: 1000,
                child: ListView(
                  children: const <Widget>[
                    Card(
                      color: Color.fromRGBO(197, 136, 172, .7),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                          AssetImage("./assets/images/user_icon.png"),
                          backgroundColor: Color.fromRGBO(197, 136, 172, .7),
                        ),
                        title: Text('Dra. Márcia',
                            style: TextStyle(color: Colors.white)),
                        subtitle: Text('OAB: 12345/MG',
                            style: TextStyle(color: Colors.white)),
                        trailing: Icon(Icons.message,
                            color: Color.fromRGBO(253, 177, 224, .7)),
                        isThreeLine: true,
                      ),
                    ),
                    Card(
                      color: Color.fromRGBO(197, 136, 172, .7),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                          AssetImage("./assets/images/user_icon.png"),
                          backgroundColor: Color.fromRGBO(197, 136, 172, .7),
                        ),
                        title: Text('Dra. Virgulina',
                            style: TextStyle(color: Colors.white)),
                        subtitle: Text('OAB: 4321/SP',
                            style: TextStyle(color: Colors.white)),
                        trailing: Icon(Icons.message,
                            color: Color.fromRGBO(253, 177, 224, .7)),
                        isThreeLine: true,
                      ),
                    ),
                    Card(
                      color: Color.fromRGBO(197, 136, 172, .7),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                          AssetImage("./assets/images/user_icon.png"),
                          backgroundColor: Color.fromRGBO(197, 136, 172, .7),
                        ),
                        title: Text(
                          'Dr. Clark Kent',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text('OAB: 4854/PR',
                            style: TextStyle(color: Colors.white)),
                        trailing: Icon(Icons.message,
                            color: Color.fromRGBO(253, 177, 224, .7)),
                        isThreeLine: true,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  void _dropDownItemSelected(String novoItem) {
    setState(() {
      this._itemSelecionado = novoItem;
    });
  }
}
