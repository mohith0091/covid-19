import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test123/const/const.dart';
import 'package:test123/screens/homepage/home.dart';

class Login2 extends StatefulWidget {
  @override
  _Login2State createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  bool _showLogin = true;

  void _toggle() {
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

  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController conPass = TextEditingController();

  bool _success = false;
  String _userEmail = '';

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

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            constraints: BoxConstraints.expand(height: height * .65),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/loginBG.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              color: Colors.black38,
            ),
          ),
          Positioned(
            top: 180,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  _showLogin
                      ? "Login to your account"
                      : "Sign up to your account",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            top: height * .40,
            child: ClipPath(
              clipper: CusClipper(),
              child: Container(
                height: height * .6,
                width: width,
                decoration: BoxDecoration(
                  color: Color(0xffeeeeee),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          _showLogin
                              ? "Create account? "
                              : "Already have an Account?",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: _toggle,
                          child: Text(
                            _showLogin ? "Sign up" : "Login",
                            style: TextStyle(
                              color: kPrinaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 280,
            left: 30,
            right: 30,
            child: Container(
              padding: const EdgeInsets.all(20),
              height: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 25),
                  TextField(
                    decoration: InputDecoration(hintText: "Email"),
                    controller: email,
                  ),
                  SizedBox(height: 25),
                  TextField(
                    decoration: InputDecoration(hintText: "Password"),
                    controller: pass,
                  ),
                  SizedBox(height: 25),
                  _showLogin
                      ? SizedBox()
                      : TextField(
                          decoration:
                              InputDecoration(hintText: "Confirm Password"),
                          controller: conPass,
                        ),
                  SizedBox(height: 25),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                      gradient: LinearGradient(
                        colors: [kPrinaryColor, kSecondaryColor],
                      ),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: _showLogin ? _login : _signup,
                        child: Text(
                          _showLogin ? "Login" : 'Signup',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CusClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;

    Path clippedPath = Path();

    clippedPath.moveTo(0, height * .4);
    clippedPath.lineTo(0, height);
    clippedPath.lineTo(width, height);
    clippedPath.lineTo(width, 0);
    clippedPath.lineTo(0, height * .4);

    return clippedPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
