import 'package:flutter/material.dart';

class ButtomCustom extends StatelessWidget {

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;
  final Function onClick;

  const ButtomCustom(
      {Key key, this.text, this.backgroundColor, this.textColor, this.icon, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      SizedBox(
      height: 48,
      width: 332,
      child: RaisedButton(
        elevation: 10,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0)
        ),
        onPressed: this.onClick,
        color: this.backgroundColor,
        textColor: this.textColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // Replace with a Row for horizontal icon + text
          children: <Widget>[
            Icon(this.icon, size: 48),
            Text(this.text, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    ),
        SizedBox(height: 12)],
    );
  }
}