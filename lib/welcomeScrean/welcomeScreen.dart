import 'package:flutter/material.dart';
import 'package:test123/const/const.dart';
import 'package:test123/loginPage/login2.dart';

class WecomeScreen extends StatefulWidget {
  @override
  _WecomeScreenState createState() => _WecomeScreenState();
}

class _WecomeScreenState extends State<WecomeScreen> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

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
    setState(() {
      _currentIndex = index;
      print(_currentIndex);
    });
  }

  void _controle(state) {
    if (state == 'next') {
      if (_currentIndex == 2) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login2()));
      } else {
        _pageController.nextPage(
            duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      }
    } else {
      _pageController.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
            constraints: BoxConstraints.expand(),
            child: PageView.builder(
              onPageChanged: _changeIndex,
              controller: _pageController,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  constraints: BoxConstraints.expand(),
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
                            image: AssetImage(_images[index]),
                          ),
                        ),
                      ),
                      SizedBox(height: 60),
                      Center(
                        child: Text(
                          _titles[index],
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
                        onTap: () => _controle('previous'),
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
                  onTap: () => _controle('next'),
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
