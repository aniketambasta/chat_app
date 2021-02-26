import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  var email;

  var password;

  var authc = FirebaseAuth.instance;
  bool sspin = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: sspin,
      child: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text('Log in'),
          ),
          body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://c4.wallpaperflare.com/wallpaper/790/791/601/northern-lights-aurora-borealis-uk-2015-wallpaper-preview.jpg'),
//                        "https://c4.wallpaperflare.com/wallpaper/311/605/196/winter-stars-aurorae-snow-wallpaper-preview.jpg"),
                    fit: BoxFit.cover)),
            padding: EdgeInsets.all(26.0),
            child: Column(
              children: <Widget>[
                TextField(
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Email Address'),
                ),
                SizedBox(
                  height: 50,
                ),
                TextField(
                  obscureText: true,
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Material(
                    elevation: 15,
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                    child: MaterialButton(
                        child: Text('Log in'),
                        onPressed: () async {
                          setState(() {
                            sspin = true;
                          });
                          try {
                            var signin = await authc.signInWithEmailAndPassword(
                                email: email, password: password);

                            if (signin != null) {
                              Navigator.pushNamed(context, "feed");
                              setState(() {
                                sspin = false;
                              });
                            }
                          } catch (e) {
                            print(e);
                          }
                        }))
              ],
            ),
          )),
    );
  }
}

/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    var fsconnect = FirebaseFirestore.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Here'),
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
    );
  }
}
*/
