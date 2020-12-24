import 'package:flutter/material.dart';
import 'package:test123/const/const.dart';

class LoginButton extends StatelessWidget {
  final String name;

  const LoginButton({this.name = "hi"});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      // color: Colors.red,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
        gradient: LinearGradient(
          colors: [
            kPrinaryColor,
            kSecondaryColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
