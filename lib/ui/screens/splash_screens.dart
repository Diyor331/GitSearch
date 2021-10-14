import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  Future<Duration?> checkSplash() async {
    await Future.delayed(const Duration(milliseconds: 4000), () {
      Navigator.pushNamed(context, '/home');
    });
  }

  @override
  void initState() {
    checkSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: CircularProgressIndicator(),
          ),
          SizedBox(height: 8),
          Text(
            'Загрузка...',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
