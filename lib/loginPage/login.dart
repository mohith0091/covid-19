import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test123/const/const.dart';
import 'package:test123/screens/homepage/home.dart';

import 'widgets/loginButton.dart';

// import '../funtions/authFuntions.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({@required this.title, this.name});

  final String title;
  final String name;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController conPass = TextEditingController();

  bool _success = false;
  String _userEmail = '';

  bool _showLogin = true;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _signup() async {
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email.text)) {
      _showMyDialog("Email Error");
    } else if (pass.text.length < 6) {
      _showMyDialog("Password must be greater than 6 chareter");
    } else if (pass.text != conPass.text) {
      _showMyDialog("Password Not Match");
    } else {
      try {
        final User user = (await _auth.createUserWithEmailAndPassword(
          email: email.text,
          password: pass.text,
        ))
            .user;

        if (user != null) {
          setState(() {
            _success = true;
            _userEmail = user.email;
            _showMyDialog(_userEmail + ' Success');
          });
        } else {
          _success = false;
        }
      } catch (e) {}
    }
  }

  void _login() async {
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email.text)) {
      _showMyDialog("Email Error");
    } else if (pass.text.length < 6) {
      _showMyDialog("Password must be greater than 6 chareter");
    } else {
      try {
        final User user = (await _auth.signInWithEmailAndPassword(
          email: email.text,
          password: pass.text,
        ))
            .user;

        if (user != null) {
          setState(() {
            _success = true;
            _userEmail = user.email;
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          });
        } else {
          _success = false;
        }
      } catch (e) {
        _showMyDialog("Email or Password is wrong ");
      }
    }
  }

  void _toggelButton() {
    setState(() {
      _showLogin = !_showLogin;
    });
  }

  Future<void> _showMyDialog(message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: Container(
        height: height,
        width: width,
        // color: kPrinaryColor,
        child: Stack(
          children: [
            Container(
              height: height * 0.5,
              width: width,
              // color: Colors.amber,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(width * 0.7),
                ),
                color: Color(0xff4d2778),
                gradient: LinearGradient(
                  colors: [
                    // kPrinaryColor,
                    // Colors.black,
                    kPrinaryColor,
                    kSecondaryColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Positioned(
              left: -50,
              top: -50,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.all(
                    Radius.circular(200),
                  ),
                ),
              ),
            ),
            Positioned(
              right: -30,
              top: -30,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.all(
                    Radius.circular(200),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 40,
              right: 40,
              top: 150,
              child: Container(
                padding: EdgeInsets.all(25),
                height: height * 0.7,
                width: width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        _showLogin ? "Login" : 'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kPrinaryColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        labelText: "Enter your Email",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kPrinaryColor,
                          fontSize: 18,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: pass,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.visibility),
                        labelText: "Enter your password",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kPrinaryColor,
                          fontSize: 18,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    _showLogin
                        ? SizedBox()
                        : TextField(
                            controller: conPass,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.visibility),
                              labelText: "Confirm your password",
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrinaryColor,
                                fontSize: 18,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                          ),
                    SizedBox(height: 3),
                    SizedBox(height: 40),
                    _showLogin
                        ? GestureDetector(
                            onTap: _login,
                            child: LoginButton(name: "Login"),
                          )
                        : GestureDetector(
                            onTap: _signup,
                            child: LoginButton(name: "Sign Up"),
                          ),
                    SizedBox(height: 20),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Positioned(
              top: height * .93,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _showLogin
                        ? "Don't have an account? "
                        : "Already have an account? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  GestureDetector(
                    onTap: _toggelButton,
                    child: Text(
                      _showLogin ? "Sign Up" : 'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
