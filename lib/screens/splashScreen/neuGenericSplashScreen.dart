import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rounakmusicplayerapp/screens/signinScreen/neuLoginScreen.dart';
import 'package:rounakmusicplayerapp/utils/neuConstants.dart';

class NeuGenericSplashScreen extends StatefulWidget {
  const NeuGenericSplashScreen({Key? key}) : super(key: key);

  @override
  _NeuGenericSplashScreenState createState() => _NeuGenericSplashScreenState();
}

class _NeuGenericSplashScreenState extends State<NeuGenericSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => NeuLogin()));
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
