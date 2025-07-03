import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double _deviceHeight, _deviceWidth;
  String? _selectedStation;

  final List<String> _stations = ['James Web Station', 'Prenure Station'];

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            _astroImageWidget(),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _pageTitle(),
                const SizedBox(height: 20),
                _destinationDropdownWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _pageTitle() {
    return const Text(
      "#GoMoon",
      style: TextStyle(
        color: Colors.white,
        fontSize: 48,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(blurRadius: 10.0, color: Colors.black87, offset: Offset(2, 2)),
        ],
      ),
    );
  }

  Widget _astroImageWidget() {
    return Container(
      width: _deviceWidth,
      height: _deviceHeight,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/astro_moon.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _destinationDropdownWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<String>(
        value: _selectedStation,
        hint: const Text("Select Station"),
        underline: const SizedBox(), // Remove default underline
        items: _stations
            .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedStation = value;
          });
        },
      ),
    );
  }
}
