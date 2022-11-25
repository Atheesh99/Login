import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/screen/home.dart';
import 'package:login_app/screen/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernamecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _username = 'atheesh';
  final _password = '12345';
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        toolbarHeight: 270,
        toolbarOpacity: 0.5,
        flexibleSpace: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/photo-1497250681960-ef046c08a56e.jfif'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(200.900),
                  bottomLeft: Radius.circular(200.900),
                ),
              ),
            ),
            Positioned(
              top: 90,
              left: 50,
              child: Text(
                "Welcome  Back !",
                textDirection: TextDirection.ltr,
                style: GoogleFonts.rockSalt(
                  fontSize: 30,
                  color: const Color.fromARGB(255, 251, 250, 248),
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Form(
              key: _formkey,
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "Login",
                        textDirection: TextDirection.ltr,
                        style: GoogleFonts.pacifico(
                          fontSize: 50,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 60,
                        width: 350,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Value is Empty';
                            } else if (value != _username) {
                              return 'INVALID USERNAME';
                            } else {
                              return null;
                            }
                          },
                          controller: _usernamecontroller,
                          cursorColor: Color.fromARGB(255, 19, 132, 23),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 8, 59, 10),
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            hintText: 'USER NAME',
                            suffix: const Icon(Icons.person_add_alt_1_rounded),
                            hintStyle:
                                TextStyle(color: Color.fromARGB(255, 4, 91, 5)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 54, 216, 221),
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 60,
                        width: 350,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Value is Empty';
                            } else if (value != _password) {
                              return 'INVALID PASSWORD';
                            } else {
                              return null;
                            }
                          },
                          obscureText: true,
                          controller: _passwordcontroller,
                          cursorColor: Color.fromARGB(255, 19, 132, 23),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 8, 59, 10),
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            hintText: 'PASSWORD',
                            suffix: Icon(Icons.lock),
                            hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 4, 47, 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 54, 216, 221),
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 200,
                          height: 50,
                          margin: const EdgeInsets.only(top: 55.0),
                          child: ElevatedButton(
                            child: const Text(
                              'LOGIN',
                              style: TextStyle(fontSize: 18),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 8, 59, 10),
                            ),
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                              } else {
                                print('Data is Empty');
                              }
                              checkLogin(context);
                            },
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30.0),
                        child: const Text(
                          'Don,t have any account ? Sign Up',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    var username = _usernamecontroller.text;
    var password = _passwordcontroller.text;
    if (username == _username && password == _password) {
      final _sharedprefs = await SharedPreferences.getInstance();
      await _sharedprefs.setBool(SAVE_KEY, true);

      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(
          builder: (ctx1) => home(),
        ),
      );
    } else {
      //snackbar
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color.fromARGB(255, 243, 92, 81),
          margin: EdgeInsets.all(15),
          content: Text('INVALID USERNAME AND PASSWORD'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
