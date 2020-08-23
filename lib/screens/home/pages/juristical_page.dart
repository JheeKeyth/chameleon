import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<List<String>> contacts = [
  ["Pão sírio", "12:02", "3"],
  ["Pão de queijo", "02:02", "4"],
  ["Pão de ló", "13:02", "1"],
  ["Pão francês", "12:52", "5"],
  ["Pão de mel", "10:32", "2"],
];

class JuristicalPage extends StatefulWidget {
  @override
  _JuristicalPageState createState() => _JuristicalPageState();
}

class _JuristicalPageState extends State<JuristicalPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFCF81B0),
          title: Text ('Conversas Advogado', style: GoogleFonts.oswald(
            textStyle: TextStyle(fontSize: 24, letterSpacing: 1.5),
          ),),
          centerTitle: true,
          leading:   new IconButton(

            icon: new Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ),
        body: new ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return new Center(
                child: Column(children: [
                  SizedBox(height: 12),
                  SizedBox(
                    height: 48,
                    width: 336,

                    child: RaisedButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),

                      ),
                      onPressed: () {},
                      color: Color(0xFFE5E5E5),
                      textColor: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // Replace with a Row for horizontal icon + text
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.person, color: Color(0xFF9D5381), size: 48,),
                              SizedBox(width: 6),
                              Text(
                                contacts[index][0],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF9D5381),
                                  shadows: [
                                    Shadow(
                                      blurRadius: 5.0,
                                      color: Colors.black38,
                                      offset: Offset(2.0, 2.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                contacts[index][1],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF9D5381),
                                ),
                              ),
                              ClipOval(
                                child: Container(
                                  width: 23,
                                  height: 23,
                                  color: Color(0xFF9D5381),
                                  child: Text(
                                    contacts[index][2],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              );
            }),
      ),
    );
  }
}
