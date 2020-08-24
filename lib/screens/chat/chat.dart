import 'package:chameleon/screens/chat/components/chat_message.dart';
import 'package:chameleon/screens/chat/components/text_composer.dart';
import 'package:chameleon/theme/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title_app),
          centerTitle: true,
          elevation: 4,
        ),
        body: Column(
          children: [
            Expanded(
              child: ChatMessage(),
            ),
            Divider(
              height: 4,
            ),
            Container(
              height: 80,
              padding: EdgeInsets.all(2),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: TextComposer(),
              ),
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(25.0),
                  topRight: const Radius.circular(25.0),
                ),
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _getMessages() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn =
        await firestore.collection("messages").get().then((value) {
      print('SNAPSHOT:  ${value.docs[0].data()}');
    });

    return qn.docs;
  }
}
