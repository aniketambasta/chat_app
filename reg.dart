import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MyReg extends StatefulWidget {
  @override
  _MyRegState createState() => _MyRegState();
}

class _MyRegState extends State<MyReg> {
  var authc = FirebaseAuth.instance;
  var email;
  var passward;
  var name;
  var lastname;
  var sspin = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: sspin,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          // backgroundColor: Colors.brown[300],
          appBar: AppBar(
            elevation: 50,
            backgroundColor: Colors.black,
            shadowColor: Colors.red,
            // backgroundColor: Colors.black,
            title: Text('Register here'),
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
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          onChanged: (value) {
                            name = value;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'First Name'),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextField(
                        style: TextStyle(color: Colors.black),
                        onChanged: (value) {
                          lastname = value;
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Last Name'),
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your email Id'),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  obscureText: true,
                  onChanged: (value) {
                    passward = value;
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your Password '),
                ),
                SizedBox(
                  height: 30,
                ),
                Material(
                  color: Colors.amberAccent,
                  elevation: 15,
                  borderRadius: BorderRadius.circular(40),
                  child: MaterialButton(
                    height: 35,
                    onPressed: () async {
                      setState(() {
                        sspin = true;
                      });
                      try {
                        print(passward);
                        var user = await authc.createUserWithEmailAndPassword(
                            email: email, password: passward);
                        print(user);
                        if (user.additionalUserInfo.isNewUser == true) {
                          Navigator.pushNamed(context, "login");
                          setState(() {
                            sspin = false;
                          });
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text('submit'),
                    // color: Colors.deepPurple[300],
                  ),
                )
              ],
            ),
          ),
        ));
    //);
  }
}
