import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';

class MyChat extends StatefulWidget {
  @override
  _MyChatState createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> {
  var msgtextcontroller = TextEditingController();

  var fs = FirebaseFirestore.instance;
  var authc = FirebaseAuth.instance;
  ScrollController scrollController = ScrollController();

  // ignore: deprecated_member_use

  String chatmsg;

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var signInUser = authc.currentUser.email;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('chat'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings_power),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          // constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("ironman.jpg"), fit: BoxFit.cover)),
          padding: EdgeInsets.only(right: 10.0),
          // width: double.infinity,
          //height: double.infinity,
          child: Column(
            children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                // stream: fs.collection('chat').orderBy('date').snapshots(),
                builder: (context, snapshot) {
                  print('new data comes');

                  /*  if (!snapshot.hasData)
                        return Center(
                          child: CircularProgressIndicator(),
                        );*/

                  var msg = snapshot.data.docs;
                  // print(msg);
                  // print(msg[0].data());

                  List<Widget> y = [];
                  for (var d in msg) {
                    // print(d.data()['sender']);
                    var msgText = d.data()['text'];
                    var msgSender = d.data()['sender'];
                    var msgWidget = Text(
                      "$msgText ",
                      style: TextStyle(color: Colors.black),
                    );

                    var bubble1 = ChatBubble(
                      clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 20),
                      backGroundColor: Colors.amber,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        child: msgWidget,
                      ),
                    );

                    y.add(bubble1);
                  }

                  print(y);

                  return Container(
                    child: Column(
                      children: y,
                    ),
                  );
                },
                stream: fs.collection("left").snapshots(),
              ),



              
             /*
             
              StreamBuilder<QuerySnapshot>(
                // stream: fs.collection('chat').orderBy('date').snapshots(),
                builder: (context, snapshot) {
                  print('new data comes');

                    if (!snapshot.hasData)
                        return Center(
                          child: CircularProgressIndicator(),
                        );

                  var msg = snapshot.data.docs;
                  // print(msg);
                  // print(msg[0].data());

                  List<Widget> y = [];
                  for (var d in msg) {
                    // print(d.data()['sender']);
                    var msgText = d.data()['text'];
                    var msgSender = d.data()['sender'];
                    var msgWidget = Text(
                      "$msgText ",
                    );

                    var bubble1 = ChatBubble(
                      clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(top: 20),
                      backGroundColor: Colors.blue,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        child: msgWidget,
                      ),
                    );

                    y.add(bubble1);
                  }

                  print(y);

                  return Container(
                    child: Column(
                      children: y,
                    ),
                  );
                },
                stream: fs.collection("right").snapshots(),
              ),
              
              */




              StreamBuilder<QuerySnapshot>(
                // stream: fs.collection('chat').orderBy('date').snapshots(),
                builder: (context, snapshot) {
                  print('new data comes');

                  /*  if (!snapshot.hasData)
                        return Center(
                          child: CircularProgressIndicator(),
                        );*/

                  var msg = snapshot.data.docs;
                  // print(msg);
                  // print(msg[0].data());

                  List<Widget> y = [];
                  for (var d in msg) {
                    // print(d.data()['sender']);
                    var msgText = d.data()['text'];
                    var msgSender = d.data()['sender'];
                    var msgWidget = Text(
                      "$msgText ",
                    );

                    var bubble = ChatBubble(
                      clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(top: 20),
                      backGroundColor: Colors.blue,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        child: msgWidget,
                      ),
                    );

                    var bubble1 = ChatBubble(
                      clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 20),
                      backGroundColor: Colors.blue,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        child: msgWidget,
                      ),
                    );
                    var temp = Container();
                    y.add(bubble1);
                  }

                  print(y);

                  return Container(
                    child: Column(
                      children: y,
                    ),
                  );
                },
                stream: fs.collection("chat").snapshots(),
              ),
              SizedBox(
                height: 580,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: deviceWidth * 0.70,
                    child: TextField(
                      controller: msgtextcontroller,
                      decoration:
                          InputDecoration(hintText: 'type your message'),
                      onChanged: (value) {
                        chatmsg = value;
                      },
                    ),
                  ),
                  Container(
                    width: deviceWidth * 0.20,
                    child: Material(
                      // color: Colors.green,
                      borderRadius: BorderRadius.circular(100),
                      child: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () async {
                          msgtextcontroller.clear();

                          await fs.collection("chat").add({
                            "text": chatmsg,
                            "sender": signInUser,
                          });
                          print(signInUser);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
class Message extends StatelessWidget {
  final String from;
  final String text;

  final bool me;

  const Message({Key key, this.from, this.text, this.me}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment:
            me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            from,
          ),
          Material(
            color: me ? Colors.teal : Colors.red,
            borderRadius: BorderRadius.circular(10.0),
            elevation: 6.0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                text,
              ),
            ),
          )
        ],
      ),
    );
  }
}*/
