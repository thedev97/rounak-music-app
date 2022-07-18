import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rounakmusicplayerapp/core/utils/neuConstants.dart';
import 'package:rounakmusicplayerapp/presentation/screens/signinScreen/loginScreen.dart';

class GenericSplashScreen extends StatefulWidget {
  const GenericSplashScreen({Key? key}) : super(key: key);

  @override
  _GenericSplashScreenState createState() => _GenericSplashScreenState();
}

class _GenericSplashScreenState extends State<GenericSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: screenHeight,
              width: screenWidth,
              color: ConstantColor.darkNeumorphicShadowColor,
              child: Center(child: Lottie.asset('assets/splashAnimation.json',height: 150,width: 150))),
        ],
      ),
    );
  }
}
