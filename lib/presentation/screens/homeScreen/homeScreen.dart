import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounakmusicplayerapp/core/utils/neuConstants.dart';
import 'package:rounakmusicplayerapp/presentation/screens/profileScreen/profileScreen.dart';

class HomeScreen extends StatefulWidget {
  String? phoneNumber;
  HomeScreen({Key? key, this.phoneNumber}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _homeScaffoldKey =
      new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homeScaffoldKey,
      backgroundColor: ConstantColor.darkNeumorphicShadowColor,
      body: Stack(
        children: [
          Container(
            child: ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                headerSec(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ?? Header section
  Widget headerSec() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        greetingText(),
        profileImgSec(),
      ],
    );
  }

  // ?? Profile img section
  Widget profileImgSec() {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, sizeHeight * 0.05, 20.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(children: [
            NeumorphicButton(
              padding: EdgeInsets.all(0.0),
              minDistance: 1,
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                color: Color(0xffF5F5F5),
                shadowDarkColor: Colors.black.withOpacity(0.1),
                shadowLightColor:
                    ConstantColor.lightThemeLightShadowColor.withOpacity(0.1),
                boxShape: NeumorphicBoxShape.circle(),
              ),
              onPressed: () async {
                try {
                  Future.delayed(Duration(microseconds: 50), () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (BuildContext context) {
                      return ProfileScreen(
                        profileName: "AVATAR",
                        phoneNumber: widget.phoneNumber,
                      );
                    }));
                  });
                } catch (exception) {
                  print(exception);
                }
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: ConstantColor.pinkButtonColor,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/defaultProfileImg.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: sizeWidth * 0.06, top: sizeHeight * 0.028),
              child: Image.asset(
                "assets/startImg.png",
                color: ConstantColor.goldThemeColor,
              ),
            ),
            Image.asset("assets/startImg.png",
                color: ConstantColor.goldThemeColor),
          ])
        ],
      ),
    );
  }

  // ?? Greeting Text
  Widget greetingText() {
    var sizeHeight = MediaQuery.of(context).size.height;
    int hour = DateTime.now().hour;
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, sizeHeight * 0.05, 0.0, 0.0),
      child: Text(
          "${hour < 12 ? "Good Morning" : hour < 17 ? "Good Afternoon" : "Good Evening"}",
          textScaleFactor: 1.0,
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: sizeHeight >= 700 ? 22.0 : 22.0,
            fontWeight: FontWeight.w800,
          )),
    );
  }
}
