import 'package:flutter/material.dart';

class NoGlowOverscrollConfiguration extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    for (var i = 1; i <= 6; i++)
                      GestureDetector(
                        onTap: () {
                          int pageNo;
                          switch (i) {
                            case 1:
                              pageNo = 0;
                              break;
                            case 2:
                              pageNo = 41;
                              break;
                            case 3:
                              pageNo = 92;
                              break;
                            case 4:
                              pageNo = 140;
                              break;
                            case 5:
                              pageNo = 193;
                              break;
                            case 6:
                              pageNo = 270;
                              break;
                            default:
                              pageNo = 0;
                          }
                          _controller.animateToPage(
                            pageNo,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              '$i',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: ScrollConfiguration(
                behavior: NoGlowOverscrollConfiguration(),
                child: PageView(
                  controller: _controller,
                  children: [
                    for (int i = 1; i <= 359; i++)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage('assets/images/$i.jpg'),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
