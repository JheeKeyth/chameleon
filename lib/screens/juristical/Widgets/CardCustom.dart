import 'package:flutter/material.dart';

class CardCustom extends StatelessWidget {

  final String text;
  final String oab;
  final Color backgroundColor;
  final Function onClick;

  const CardCustom(
      {Key key, this.text, this.oab, this.backgroundColor, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 132,
          width: 332,
          child: InkWell(
            onTap: this.onClick,
            child: Card(
              color: this.backgroundColor,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                  AssetImage("./assets/images/user_icon.png"),
                  backgroundColor: Color.fromRGBO(197, 136, 172, .7),
                ),
                title: (Text(this.text, style: TextStyle(color: Colors.white))),
                subtitle: (Text(this.oab, style: TextStyle(color: Colors.white))),
                trailing: Icon(Icons.message,
                    color: Colors.white),
                isThreeLine: true,
              ),

              ),
          ),
          ),

        SizedBox(height: 12)],
    );
  }
}