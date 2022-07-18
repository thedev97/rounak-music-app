import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounakmusicplayerapp/core/utils/neuConstants.dart';
import 'package:rounakmusicplayerapp/presentation/screens/signinScreen/loginScreen.dart';


class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({Key? key}) : super(key: key);

  @override
  _WalkThroughScreenState createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen>  with SingleTickerProviderStateMixin{
  final _pageController = PageController(initialPage: 0);
  late AnimationController _animationController;
  bool next = true;
  double pageNumber = 0;
  bool isButtonPressed = false;
  bool isButtonNextPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return body();
  }

  Widget body() {
    return Scaffold(
      backgroundColor:Color(0xff202427),
      appBar: AppBar(
        backgroundColor:Color(0xff202427),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          _pageViewSection(),
          _introSection(),
        ],
      ),
    );
  }

  Widget _pageViewSection() {
    return PageView(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        onPageChanged: (int page) {
          int previosPage = page - 1;
          int cureentPage = page;
          if (previosPage < -1 || cureentPage > 4) {
            _animationController.stop();
          } else {
            _animationController.forward();
          }
          setState(() {
            pageNumber = page.toDouble();
          });
        },
        children: [
          _remainingOfBody(
              titleOne: "ENJOY YOUR MUSIC",
              body:
              "The source of your music directly impacts the quality of sound. Get your music from a high-quality source to upgrade your music listening experience.",
              images: "assets/enjoyMusic.gif",
          ),
          _remainingOfBody(
              titleOne: "DOWNLOAD YOUR MUSIC",
              body:
              "You can enjoy music offline by downloading your favorite songs and videos to your mobile device.",
              images: "assets/downloadMusic.gif",
          ),

          _remainingOfBody(
              titleOne: "SHARE YOUR MUSIC",
              body:
              "Music can be best enjoyed and experienced when shared. Many of your favorite songs were probably recommended by your close friends.",
              images: "assets/shareMusic.gif",
          ),
        ]);
  }

  Widget _remainingOfBody(
      { required String images,
        required String titleOne,
        required String body}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        introDetails(titleOne: titleOne, body: body, images: images),
      ],
    );
  }

  Padding introDetails(
      { required String images,
        required String titleOne,
        required String body}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 250,
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(images,),fit: BoxFit.fitHeight
                )
              ),),
          SizedBox(height: 80.0,),
          Text(
              titleOne,
              style: GoogleFonts.lato(
                  color: ConstantColor.pinkButtonColor,
                  fontSize: 16.0,fontWeight: FontWeight.w500)
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              body,
              style: GoogleFonts.lato(
                  height: 1.8,
                  color: ConstantColor.pinkButtonColor.withOpacity(0.65),
                  fontSize: 14.0,fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }


  // ? This widget shows the hobnob logo, the next and previous buttons with the dots Indicator
  Widget _introSection() {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  pageNumber == 0 ? Container() : Padding(
                    padding: EdgeInsets.only(left: 20.0, bottom: 40.0),
                    child: NeumorphicButton(
                      provideHapticFeedback: true,
                      onPressed: (){
                        try {
                          if (pageNumber == 0) {

                          } else {
                            _pageController.previousPage(
                                duration: Duration(seconds: 1),
                                curve: Curves.ease);
                            next = false;
                          }
                        } catch (exception) {
                          print(exception);
                        }
                      },
                      style: NeumorphicStyle(
                          color: ConstantColor.pinkButtonColor,
                          shadowLightColor: Colors.white.withOpacity(0.2),
                          shadowDarkColor: Colors.black54.withOpacity(0.7),
                          depth: 25,
                          shadowLightColorEmboss: Colors.black54,
                          intensity: 5,
                          boxShape: NeumorphicBoxShape.circle()),
                      child: Icon(
                        Icons.navigate_before,
                        color:Color(0xffCFCAC8),
                      ),
                    ),
                  ),
                  pageNumber > 1 ? getStartedButton() :Padding(
                    padding: EdgeInsets.only(right: 20.0,bottom: 40.0),
                    child: NeumorphicButton(
                      provideHapticFeedback: true,
                      onPressed: (){
                        try {
                          if (pageNumber > 1) {
                          } else {
                            _pageController.nextPage(
                                duration: Duration(seconds: 1),
                                curve: Curves.ease);
                            next = true;
                          }
                        } catch (exception) {
                          print(exception);
                        }
                      },
                      style: NeumorphicStyle(
                          color: ConstantColor.pinkButtonColor,
                          shadowLightColor: Colors.white.withOpacity(0.2),
                          shadowDarkColor: Colors.black54.withOpacity(0.7),
                          depth: 25,
                          shadowLightColorEmboss: Colors.black54,
                          intensity: 5,
                          boxShape: NeumorphicBoxShape.circle()),
                      child: Icon(
                        Icons.navigate_next,
                        color:Color(0xFFCFCAC8),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getStartedButton(){
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0, 20, 40.0),
      child: SizedBox(
        width: sizeWidth*0.3,
        height: 42,
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
          child: Center(
            child: Text("GET STARTED",
                textScaleFactor: 1,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: sizeHeight >= 700 ? 12.0 : 12.0,
                  fontWeight: FontWeight.w500,
                )),
          ),
          onPressed: () {
            HapticFeedback.vibrate();
            Navigator.pushReplacement(context,
                CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return LoginScreen();
                    }));
          },
        ),
      ),
    );
  }
}
