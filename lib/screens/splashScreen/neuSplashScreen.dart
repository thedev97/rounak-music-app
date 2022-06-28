

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rounakmusicplayerapp/screens/introScreen/neuWalkthroughScreen.dart';
import 'package:rounakmusicplayerapp/utils/neuConstants.dart';

class NeuSplashScreen extends StatefulWidget {
  const NeuSplashScreen({Key? key}) : super(key: key);

  @override
  _NeuSplashScreenState createState() => _NeuSplashScreenState();
}

class _NeuSplashScreenState extends State<NeuSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => NeuWalkThroughScreen()));
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/splashAnimation.json',height: 100,width: 100),
                  SizedBox(width: 20.0,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Rounak",
                          textScaleFactor: 1,
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: screenHeight >= 700 ? 32.0 : 32.0,
                            fontWeight: FontWeight.w500,
                          )),
                      SizedBox(height: 5.0,),
                      Text("झुमो गाओ और नाचो",
                          textScaleFactor: 1,
                          style: GoogleFonts.montserrat(
                            color: ConstantColor.pinkButtonColor,
                            fontSize: screenHeight >= 700 ? 14.0 : 14.0,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
