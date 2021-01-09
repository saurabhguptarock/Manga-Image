import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: PageView(
          controller: _controller,
          children: [
            for (int i = 0; i < 84; i++)
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
    );
  }
}
