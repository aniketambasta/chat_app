import 'package:firebase_app/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/reg.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        //backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Home Page'),
        ),
        body: Center(
          child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://c4.wallpaperflare.com/wallpaper/790/791/601/northern-lights-aurora-borealis-uk-2015-wallpaper-preview.jpg'),

                    //  'https://c4.wallpaperflare.com/wallpaper/21/713/306/anime-original-aurora-australis-comet-wallpaper-preview.jpg'),
                    // 'https://c4.wallpaperflare.com/wallpaper/311/605/196/winter-stars-aurorae-snow-wallpaper-preview.jpg'),
                    // "https://c4.wallpaperflare.com/wallpaper/863/264/835/abisko-national-park-northern-lights-aurora-borealis-wallpaper-preview.jpg"),
                    fit: BoxFit.cover)),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 120,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: new AssetImage('logo_transparent.png'),
                      ),
                    )),
                SizedBox(
                  height: 100,
                ),
                Material(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(100),
                    elevation: 20,
                    child: MaterialButton(
                      height: 75,
                      minWidth: 200,
                      child: Text('Register here'),
                      onPressed: () {
                        print('click here to register');
                        Navigator.pushNamed(context, "reg");
                      },
                    )),
                SizedBox(
                  height: 50,
                ),
                Material(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(100),
                    elevation: 20,
                    child: MaterialButton(
                      height: 75,
                      minWidth: 200,
                      child: Text('Login here'),
                      onPressed: () {
                        print('click here to register');
                        Navigator.pushNamed(context, "login");
                      },
                    )),
              ],
            ),
          ),
        ));
  }
}
