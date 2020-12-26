import 'dart:ui';

import 'package:flutter/material.dart';

class WecomeScreen extends StatefulWidget {
  @override
  _WecomeScreenState createState() => _WecomeScreenState();
}

class _WecomeScreenState extends State<WecomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        constraints: BoxConstraints.expand(),
        child: PageView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              color: Colors.green,
              constraints: BoxConstraints.expand(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // margin: const EdgeInsets.only(top: 60),
                    height: 300,
                    padding: const EdgeInsets.all(40.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/person.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  Text(
                    "Wecome",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.black,
              constraints: BoxConstraints.expand(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // margin: const EdgeInsets.only(top: 60),
                    height: 300,
                    padding: const EdgeInsets.all(40.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/001.jpeg'),
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  Text(
                    "Wecome",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.yellow,
              constraints: BoxConstraints.expand(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // margin: const EdgeInsets.only(top: 60),
                    height: 300,
                    padding: const EdgeInsets.all(40.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/3.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  Text(
                    "Wecome",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
