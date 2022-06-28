import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rounakmusicplayerapp/utils/neuConstants.dart';

class NeuProfileScreen extends StatefulWidget {
  String? profileName;
  String? phoneNumber;
  NeuProfileScreen({Key? key, this.profileName, this.phoneNumber}) : super(key: key);

  @override
  _NeuProfileScreenState createState() => _NeuProfileScreenState();
}

class _NeuProfileScreenState extends State<NeuProfileScreen> {
  final GlobalKey<ScaffoldState> _profileScaffoldKey =
      new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _profileScaffoldKey,
      backgroundColor: ConstantColor.darkNeumorphicShadowColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ConstantColor.darkNeumorphicShadowColor,
        leading: backButton(),
      ),
      body: Stack(
        children: [
          Container(
            child: ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                profileText(),
                profileSec(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget backButton() {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios_sharp,
        size: 16,
        color: Colors.white,
      ),
    );
  }

  // ?? Profile Text
  Widget profileText() {
    var sizeHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, sizeHeight * 0.02, 0.0, 20.0),
      child: Text('Profile',
          textScaleFactor: 1.0,
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: sizeHeight >= 700 ? 22.0 : 22.0,
            fontWeight: FontWeight.w800,
          )),
    );
  }

  // ?? User Image
  Widget userImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/defaultProfileImg.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              userDetail(),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Lottie.asset('assets/editProfileIcon.json',height: 30,width: 30),
        ),
      ],
    );
  }

  // ?? Profile Section
  Widget profileSec() {
    var sizeHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: Container(
        height: sizeHeight * 0.1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ConstantColor.darkNeumorphicShadowColor,
              ConstantColor.darkThemeLightShadowColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                offset: Offset(1.0, 1.0),
                blurRadius: 0.5,
                spreadRadius: 0.5),
            BoxShadow(
                color: Colors.white.withOpacity(0.1),
                offset: Offset(-1.0, -1.0),
                blurRadius: 0.4,
                spreadRadius: 0.4),
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: userImage(),
      ),
    );
  }

  // ?? User Detail
  Widget userDetail() {
    var sizeHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Text(
                  '${widget.profileName}',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: sizeHeight >= 700 ? 12.0 : 12.0,
                    fontWeight: FontWeight.w700,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Icon(Icons.phone_rounded, size: 12.0, color: Colors.white,),
              SizedBox(width: 5.0,),
              Text("${widget.phoneNumber != "" ? widget.phoneNumber : "8249454137"}",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: sizeHeight >= 700 ? 10.0 : 10.0,
                    fontWeight: FontWeight.w400,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
