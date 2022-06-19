
import 'dart:async';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:rounakmusicplayerapp/screens/neuMainScreen.dart';
import 'package:rounakmusicplayerapp/utils/inputfeilds/neuInputFeild.dart';
import 'package:rounakmusicplayerapp/utils/neuConstants.dart';

class NeuLogin extends StatefulWidget {
  const NeuLogin({Key? key}) : super(key: key);

  @override
  _NeuLoginState createState() => _NeuLoginState();
}

class _NeuLoginState extends State<NeuLogin> {
  late TextEditingController _phoneNumberEditingController;
  late TextEditingController _otpController;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _loginKey = GlobalKey<FormState>();
 // FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneNumberEditingController = TextEditingController();
    _otpController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneNumberEditingController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: Platform.isAndroid,
      bottom: Platform.isAndroid,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: ConstantColor.darkNeumorphicShadowColor,
          child: Stack(children: [
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
              child: ListView(
                children: [
                  loginPhoneForm(),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  // ?This is the login form for the user
  Widget loginPhoneForm() {
    var sizeHeight = MediaQuery.of(context).size.height;
    return Form(
      key: _loginKey,
      child: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.9,
                  width: MediaQuery.of(context).size.width * 0.65,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff202427),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black54,
                            offset: Offset(1.0, 1.0),
                            blurRadius: 0.5,
                            spreadRadius: 0.5),
                        BoxShadow(
                            color:Colors.white.withOpacity(0.1),
                            offset: Offset(-1.0, -1.0),
                            blurRadius: 0.4,
                            spreadRadius: 0.4),
                      ]
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Center(child: Lottie.asset('assets/lottieMusicAnimation.json',)),
                  ),
                ),
              ),
              welcomeText(),
              welcomeTextTwo(),
              Padding(
                padding: EdgeInsets.only(
                    left: 10.0, top: 35.0, bottom: 35.0, right: 10.0),
                child: numberForm(),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 0, 0, 30.0),
                  child: NeumorphicButton(
                    minDistance: 1,
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      color: ConstantColor.pinkButtonColor,
                      shadowDarkColor: ConstantColor.darkThemeDarkShadowColor,
                      shadowLightColor: ConstantColor.darkThemeLightShadowColor,
                      surfaceIntensity: 0.4,
                      intensity: 0.86,
                      depth: 8,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(17.0)),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                      child: Text("Continue",
                          textScaleFactor: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: sizeHeight >= 700 ? 14.0 : 12.0,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    onPressed: () {
                      HapticFeedback.vibrate();
                      Future.delayed(Duration(milliseconds: 500), () async {
                        otpSheet();
                      });
                    },
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  /// !!! phoneTextOne
  Widget welcomeText() {
    var sizeHeight = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.fromLTRB(22.0, sizeHeight * 0.01, 0, 0),
        child: Text("Welcome",
            textScaleFactor: 1,
            style: TextStyle(
              color: ConstantColor.darkModeColor,
              fontSize: sizeHeight >= 700 ? 12.0 : 12.0,
              fontWeight: FontWeight.w500,
            )),
      ),
    );
  }

  /// !!! phoneTextTwo
  Widget welcomeTextTwo() {
    var sizeHeight = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.fromLTRB(22.0, 15.0, 0, 0),
        child: Text("Sign In",
            textScaleFactor: 1,
            style: TextStyle(
              color: Colors.white,
              fontSize: sizeHeight >= 700 ? 30.0 : 30.0,
              fontWeight: FontWeight.w900,
            )),
      ),
    );
  }

  /// !!! numberForm
  Widget numberForm() {
    return Column(
      children: [
        NeuInputFieldThree(
          controller: _phoneNumberEditingController,
          edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 10.0),
          obscureText: false,
          labelPresent: false,
          hintText: 'Mobile number',
          maxLength: 10,
          keyBoardType: TextInputType.phone,
          textCapitalization: TextCapitalization.none,
          validatorFunction: (value) {
            if (value!.isEmpty) {
              return "Please enter phone number";
            }
            if (!RegExp(r'(^([5-9][0-9]{9})$)').hasMatch(value)) {
              return "Please enter a valid number";
            } else {
              return null;
            }
          },
          autoFocus: false,
        ),
        /* Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Divider(
            thickness: 2,
            endIndent: 50,
          ),
        )*/
      ],
    );
  }

  /// !!! otpSheet
  otpSheet(){
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => buildSheet());
  }

  /// !!! otpBuildSheet
  Widget buildSheet() =>
      Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: DraggableScrollableSheet(
          initialChildSize: Platform.isIOS ? 0.55 :0.5,
          minChildSize: Platform.isIOS ? 0.55 :0.5,
          builder: (_, controller) => Container(
            decoration: BoxDecoration(
                color: Color(0xffF5F5F5),
                borderRadius: new BorderRadius.only(
                  topLeft:  Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                )
            ),
            child: ListView(
                controller: controller,
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.only(left: 0,right: 0,top: 20.0,bottom: 20.0),
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 15.0,top: 0),
                      child: Container(
                          width: 55,
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:Color(0xff343739),
                          )),
                    ),
                  ),
                  Align(alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 0.0,bottom: 0.0),
                        child: Lottie.asset('assets/enterOtpAnimation.json',height: 60,width: 60)
                      )),
                  otpText(),
                  otpTextTwo(),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0,right: 15.0),
                    child: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return NeuInputFieldThree(
                          controller: _otpController,
                          maxLength: 6,
                          autoFocus: false,
                          edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 10.0),
                          labelPresent: false,
                          obscureText: false,
                          keyBoardType: TextInputType.number,
                          hintText: 'OTP',
                          enabled: true,
                          validatorFunction: (value) {
                            if (value!.isEmpty) {
                              return "Please enter the otp";
                            }
                            if (value.length < 6) {
                              return "Please enter a valid otp";
                            } else {
                              return null;
                            }
                          },
                          );
                        }),
                  ),
                  continueButton(),
                ]
            ),
          ),
        ),
      );


  /// !!! continueButton
  Widget continueButton(){
    var sizeHeight = MediaQuery.of(context).size.height;
    return Align(
        alignment: Alignment.topLeft,
        child: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 40.0, 0, 0),
            child: SizedBox(
              width: 150,
              height: 50,
              child: NeumorphicButton(
                onPressed: (){
                  HapticFeedback.vibrate();
                  Future.delayed(Duration(milliseconds: 500), () {
                    HapticFeedback.vibrate();
                    Navigator.pushReplacement(context,
                        CupertinoPageRoute(
                            builder: (BuildContext context) {
                              return NeuMainScreen();
                            }));
                  });
                },
                minDistance: 1,
                style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  color: ConstantColor.pinkButtonColor,
                  shadowDarkColor: ConstantColor.lightThemeLightShadowColor,
                  shadowLightColor: ConstantColor.lightThemeDarkShadowColor,
                  surfaceIntensity: 0.4,
                  intensity: 0.86,
                  depth: 8,
                  boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.circular(30.0)),
                ),
                child: Center(
                  child: Text(
                      "Continue",
                      textScaleFactor: 1,
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: sizeHeight >= 700 ? 14.0 : 12.0,fontWeight: FontWeight.w400,)
                  ),
                ),
              ),
            )
        ));
  }

  /// !!! otpText
  Padding otpText() {
    var sizeHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.fromLTRB(25.0, 20, 0, 5),
      child: Text(
          'We have sent you an OTP',
          textScaleFactor: 1.0,
          style: TextStyle(
            color: Color(0xff4B4E4F),
            fontSize: sizeHeight >= 700 ? 14.0 : 12.0,
            fontWeight: FontWeight.w700,)
      ),
    );
  }

  /// !!! otpTextTwo
  Padding otpTextTwo() {
    var sizeHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.fromLTRB(25.0, 5, 0, 20),
      child: Text(
          'Enter the 6 digit OTP sent to +91- ${_phoneNumberEditingController.text}',
          textScaleFactor: 1.0,
          style: TextStyle(
            color:Color(0xff4B4E4F).withOpacity(0.7),
            fontSize: sizeHeight >= 700 ? 12.0 : 10.0,fontWeight: FontWeight.w400,)
      ),
    );
  }
}
