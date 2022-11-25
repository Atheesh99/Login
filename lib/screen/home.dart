import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/screen/login.dart';

import 'package:shared_preferences/shared_preferences.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              GlassmorphicContainer(
                height: 500,
                width: 330,
                borderRadius: 25,
                blur: 2,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                  top: 200,
                ),
                border: 2,
                linearGradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(.02),
                    Colors.white38.withOpacity(0.02)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderGradient: LinearGradient(
                  colors: [
                    Colors.white24.withOpacity(0.2),
                    Colors.white70.withOpacity(0.2)
                  ],
                ),
                child: Column(
                  children: [
                    Positioned(
                      top: 40,
                      child: Container(
                        margin: const EdgeInsets.only(top: 60),
                        child: Text(
                          'Arts of Plants',
                          textDirection: TextDirection.ltr,
                          style: GoogleFonts.rockSalt(
                            fontSize: 25,
                            color: Color.fromARGB(255, 251, 250, 248),
                            letterSpacing: 1,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: const Text(
                          'you cannot Buy happiness,but\n you can buy plants,and that\'s\n pretty much the some thing.',
                          style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 1,
                              color: Colors.white,
                              wordSpacing: 2),
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      height: 60,
                      margin: const EdgeInsets.only(top: 65.0),
                      child: ElevatedButton(
                        child: const Text(
                          'SIGNOUT',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: Color.fromARGB(255, 195, 195, 195),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                            width: 2.0,
                            color: Color.fromARGB(115, 236, 233, 233),
                          ),
                          backgroundColor: Color.fromARGB(255, 8, 80, 10),
                        ),
                        onPressed: () {
                          signout(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/photo-1497250681960-ef046c08a56e.jfif",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  signout(BuildContext ctx) async {
    final _sharedpref = await SharedPreferences.getInstance();
    await _sharedpref.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => Login()), (route) => false);
  }
}
