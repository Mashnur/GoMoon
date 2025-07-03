import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  late double _deviceHeight, _deviceWidth;
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [_astroImageWidget(), _pageTitle()],
        ),
      ),
    );
  }

  Widget _pageTitle() {
    return const Text(
      "#GoMoon",
      style: TextStyle(
        color: Colors.black,
        fontSize: 70,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(blurRadius: 10.0, color: Colors.black87, offset: Offset(2, 2)),
        ],
      ),
    );
  }

  Widget _astroImageWidget() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/astro_moon.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
