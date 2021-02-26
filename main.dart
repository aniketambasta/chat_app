import 'package:firebase_app/feed.dart';
import 'package:firebase_app/home.dart';
import 'package:firebase_app/login.dart';
import 'package:firebase_app/reg.dart';
import 'package:firebase_app/splash.dart';
import 'package:firebase_app/splash.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      // home: MyHome(),
      initialRoute: "splash",
      routes: {
        "home": (context) => MyHome(),
        "reg": (context) => MyReg(),
        "login": (context) => MyLogin(),
        "feed": (context) => MyChat(),
        "splash": (context) => MySplash(),
        //"chat": (context) => Chat(),
      },
    ),
  );
}
/*
class MyApp extends StatelessWidget {
  /* myget() async {
    var d = await fsconnect.collection("data").get();
    for (var i in d.docs) {
      print(i.data());
    }
  }*/

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    var fsconnect = FirebaseFirestore.instance;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fire base Appp'),
        ),
        body: RaisedButton(
          child: Text('send data'),
          onPressed: () {
            fsconnect.collection("data").add({
              'name': 'sarah',
              'title': 'xyz',
              'email': 'sarah@gmail.com',
            });
            print("send ..");
          },
        ),
      ),
    );
  }
}
*/
/*import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'chatapp/chat_screen.dart';
import 'chatapp/auth_screen.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        backgroundColor: Colors.pink,
        accentColor: Colors.deepPurple,
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.pink,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: StreamBuilder(stream: FirebaseAuth.instance.onAuthStateChanged, builder: (ctx, userSnapshot) {
        if (userSnapshot.hasData) {
          return ChatScreen();
        }
        return AuthScreen();
      }),
    );
  }
}

*/
