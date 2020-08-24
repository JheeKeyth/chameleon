import 'package:chameleon/model/Psycologist.dart';
import 'package:chameleon/screens/chat/chat.dart';
import 'package:chameleon/screens/juristical/Widgets/CardCustom.dart';
import 'package:flutter/material.dart';

class PsychologistPage extends StatefulWidget {
  @override
  _PsychologistPageState createState() => _PsychologistPageState();
}

class _PsychologistPageState extends State<PsychologistPage> {
  String nomeCidade = "";
  List list = new List <Psycologist>();
  addDumbData() {
    this.list.add(new Psycologist(nome: 'Helio Hideo', crp: '123456'));
    this.list.add(new Psycologist(nome: 'Helio Hideo', crp: '123456'));
    this.list.add(new Psycologist(nome: 'Helio Hideo', crp: '123456'));
    this.list.add(new Psycologist(nome: 'Helio Hideo', crp: '123456'));
    this.list.add(new Psycologist(nome: 'Helio Hideo', crp: '123456'));
    this.list.add(new Psycologist(nome: 'Helio Hideo', crp: '123456'));
    this.list.add(new Psycologist(nome: 'Helio Hideo', crp: '123456'));
    this.list.add(new Psycologist(nome: 'Helio Hideo', crp: '123456'));
    this.list.add(new Psycologist(nome: 'Helio Hideo', crp: '123456'));
    this.list.add(new Psycologist(nome: 'Helio Hideo', crp: '123456'));
    this.list.add(new Psycologist(nome: 'Helio Hideo', crp: '123456'));
    this.list.add(new Psycologist(nome: 'Helio Hideo', crp: '123456'));
  }
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
    addDumbData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Psicólogos"),
        leading: IconButton(
            tooltip: 'Voltar',
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Color.fromRGBO(152, 100, 158, .7),
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
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: this.list.length,
                    itemBuilder: (BuildContext context, index){
                      return ListTile(
                        title: CardCustom(
                            text: this.list[index].nome,
                            oab: this.list[index].crp,
                            backgroundColor: Color(0xFFC781CF),

                            onClick: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Chat()),
                            );
                            }
                        ),
                      );
                    }
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
