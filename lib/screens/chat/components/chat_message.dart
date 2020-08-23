import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  //  final Map<String, dynamic> data;
  final dynamic snapshot;
  final int index;

  ChatMessage({this.snapshot, this.index});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: [],
        stream: FirebaseFirestore.instance.collection("messages").orderBy("senderDate", descending: true).snapshots(),
        builder: (context, snapshot) {
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              return ListView.builder(
                  reverse: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 16.0),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://source.unsplash.com/random'),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                    '${snapshot.data.docs[index].data()['senderName']}'),
                                Container(
                                  margin: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                      '${snapshot.data.docs[index].data()['text']}'),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }
              );
          }
        }
    );
  }
}
