import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test123/const/const.dart';
import 'package:test123/loginPage/login2.dart';

class WecomeScreen extends StatefulWidget {
  @override
  _WecomeScreenState createState() => _WecomeScreenState();
}

class _WecomeScreenState extends State<WecomeScreen> {
  int _currentIndex = 0;

  List _images = [
    'assets/images/person.png',
    'assets/images/001.jpeg',
    'assets/images/2.png',
  ];
  List _titles = [
    'page 1',
    'The threat is the virus, not the people',
    'Be Informed\nBe Prepared\nBe Smart\nBe Safe'
  ];

  void _changeIndex(index) {
    if (index > 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Login2()));
    } else {
      setState(() {
        _currentIndex = index;
        print(_currentIndex);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            child: PageView.builder(
              onPageChanged: _changeIndex,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        kPrinaryColor,
                        kSecondaryColor,
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // margin:_changeIndex(index) const EdgeInsets.only(top: 60),
                        height: 300,
                        padding: const EdgeInsets.all(40.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(_images[_currentIndex]),
                          ),
                        ),
                      ),
                      SizedBox(height: 60),
                      Center(
                        child: Text(
                          _titles[_currentIndex],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 15,
            left: 15,
            right: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _currentIndex >= 1
                    ? GestureDetector(
                        onTap: () => _changeIndex(_currentIndex - 1),
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back_ios, color: Colors.white),
                            Text(
                              "Previous",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
                GestureDetector(
                  onTap: () => _changeIndex(_currentIndex + 1),
                  child: Row(
                    children: [
                      Text(
                        _currentIndex == 2 ? "Login" : "Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.white),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
