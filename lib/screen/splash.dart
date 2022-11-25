import 'package:flutter/material.dart';
import 'package:login_app/screen/home.dart';
import 'package:login_app/screen/login.dart';

import 'package:shared_preferences/shared_preferences.dart';

const SAVE_KEY = 'UserLoggedIn';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    checkUserLogigin();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color.fromARGB(255, 7, 100, 10)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(
                          Icons.water_drop_outlined,
                          color: Color.fromARGB(255, 17, 92, 56),
                          size: 50.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        'Plants',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void dispose() {
    super.dispose();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(
      Duration(seconds: 2),
    );
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (ctx) => Login(),
    ));
  }

  Future<void> checkUserLogigin() async {
    final _sharedprefs = await SharedPreferences.getInstance();
    // _sharedprefs.setBool(SAVE_KEY, true);
    final _userLoggedIn = _sharedprefs.getBool(SAVE_KEY);
    if (_userLoggedIn == null || _userLoggedIn == false) {
      gotoLogin();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => home()));
    }
  }
}
