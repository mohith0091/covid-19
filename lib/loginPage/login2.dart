import 'package:flutter/material.dart';
import 'package:test123/const/const.dart';

class Login2 extends StatefulWidget {
  @override
  _Login2State createState() => _Login2State();
}

class _Login2State extends State<Login2> {
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
                  "Login to your account",
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
                          "Create account? ",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Sign up",
                          style: TextStyle(
                            color: kPrinaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
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
                  SizedBox(height: 30),
                  TextField(
                    decoration: InputDecoration(hintText: "Email"),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                  SizedBox(height: 40),
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
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
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
