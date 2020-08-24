//flutter imports
import 'package:chameleon/screens/chat/chat.dart';
import 'package:chameleon/screens/emergency/emergency_page.dart';
import 'package:chameleon/screens/home/widgets/slider_home.dart';
import 'package:chameleon/screens/juristical/juristical.dart';
import 'package:chameleon/screens/psychologist/psychologist.dart';
import 'package:flutter/material.dart';
//local imports
import 'package:chameleon/screens/home/widgets/drawer_menu.dart';
import 'package:google_fonts/google_fonts.dart';
//package imports
import 'package:geolocator/geolocator.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Position _currentPosition;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){return;},
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.only(top: 80),
          child: Column(
            children: [
              Expanded(
                child: SliderHome(),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  child:  Text(
                    'Se identificou com alguma situação? \n Não tenha medo de pedir ajuda.\n Estamos aqui por você!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.oswald(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Container(
                color: Theme.of(context).primaryColor,
                height: 77,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return EmergencyPage();
                              },
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: BottomNavigatorItem(
                                  icon: Icons.security,
                                  text: 'Emergência',
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                height: 77,
                                width: 3,
                              ),
                            ],
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return JuristicalPage();
                              },
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: BottomNavigatorItem(
                                  icon: Icons.gavel,
                                  text: 'Jurídico',
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 9),
                                color: Colors.white,
                                height: 77,
                                width: 3,
                              ),
                            ],
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return PsychologistPage();
                              },
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: BottomNavigatorItem(
                                  icon: Icons.person,
                                  text: 'Psicólogo',
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 9),
                                color: Colors.white,
                                height: 77,
                                width: 3,
                              ),
                            ],
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return Chat();
                              },
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BottomNavigatorItem(
                                icon: Icons.group,
                                text: 'Grupo',
                              ),
                            ],
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          width: 110,
          height: 110,
          padding: EdgeInsets.only(bottom: 35),
          child: FloatingActionButton(
            backgroundColor: Color(0xFFFF6961),
            child: Text(
              'SOS',
              style: GoogleFonts.oswald(
                fontSize: 30,
                color: Colors.white
              ),
            ),
            onPressed: (){
              _getCurrentLocation();
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        drawer: Drawer(
          child: DrawerMenu(),
        ),
      ),
    );
  }

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      String texto = 'Erro ao pegar localização da vítima.';
      if (_currentPosition != null) {
        texto =
        "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}";
      }
      FlutterOpenWhatsapp.sendSingleMessage("5534991572772", texto);
    }).catchError((e) {
      print(e);
    });
  }
}



class BottomNavigatorItem extends StatefulWidget {

  final String text;
  final IconData icon;

  BottomNavigatorItem({
    this.text,
    this.icon
  });

  @override
  _BottomNavigatorItemState createState() => _BottomNavigatorItemState();
}

class _BottomNavigatorItemState extends State<BottomNavigatorItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(
            widget.icon,
            color: Colors.white,
            size: 32,
          ),
        ),
        Text(
          widget.text,
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

