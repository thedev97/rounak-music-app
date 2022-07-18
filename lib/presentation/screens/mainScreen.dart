import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:rounakmusicplayerapp/core/utils/neuConstants.dart';
import 'dart:io' show Platform;
import 'discoverScreen/discoverScreen.dart';
import 'homeScreen/homeScreen.dart';
import 'libraryScreen/libraryScreen.dart';

class MainScreen extends StatefulWidget {
  String? phoneNumber;
  MainScreen({Key? key, this.phoneNumber}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  bool showOptions = false;
  late List<Widget> _screenList;
  bool disableLocateHospital = false;
  bool showLoader = false;
  late DateTime currentBackPressTime;

  @override
  void initState() {
    super.initState();
    _screenList = <Widget>[
      HomeScreen(
        phoneNumber: widget.phoneNumber,
      ),
      DiscoverScreen(),
      LibraryScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: _bottomTabBar(),
        resizeToAvoidBottomInset: true,
        body: PageTransitionSwitcher(
            duration: Duration(milliseconds: 800),
            transitionBuilder: (Widget child,
                Animation<double> primaryAnimation,
                Animation<double> secondaryAnimation) {
              return FadeThroughTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child: _screenList.elementAt(_selectedIndex)),
      ),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Tap again to exit");
      return Future.value(false);
    }
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    }
    return Future.value(false);
  }

  Widget _bottomTabBar() {
    var sizeHeight = MediaQuery.of(context).size.height;
    return Container(
      height: Platform.isIOS ? sizeHeight * 0.1 : 60.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xff202427),
          primaryColor: Colors.red,
          bottomAppBarColor: Colors.green,
        ),
        // sets the inactive color of the `BottomNavigationBar`
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              onTap: switchScreens,
              selectedLabelStyle: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.w500,
              ),
              selectedItemColor: ConstantColor.pinkButtonColor,
              unselectedItemColor: ConstantColor.tabUnSelColor,
              items: [
                BottomNavigationBarItem(
                    icon: _selectedIndex == 0
                        ? Image.asset(
                            "assets/homeTabSel.png",
                            height: 20,
                            width: 20,
                          )
                        : Image.asset(
                            "assets/HomeUnSel.png",
                            height: 20,
                            width: 20,
                          ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: _selectedIndex == 1
                        ? Center(
                            child: Image.asset(
                              "assets/discoverTabSel.png",
                              height: 20,
                              width: 20,
                            ),
                          )
                        : Image.asset(
                            "assets/discoverTabUnSel.png",
                            height: 22,
                            width: 22,
                          ),
                    label: 'Search'),
                BottomNavigationBarItem(
                    icon: _selectedIndex == 2
                        ? Center(
                            child: Image.asset(
                              "assets/libraryTabSel.png",
                              height: 20,
                              width: 20,
                            ),
                          )
                        : Image.asset(
                            "assets/libraryTabUnSel.png",
                            height: 22,
                            width: 22,
                          ),
                    label: 'Library'),
              ]),
        ),
      ),
    );
  }

  // ? A function to execute the switching of screens with the navigation bar
  void switchScreens(int index) async {
    try {
      setState(() {
        _selectedIndex = index;
      });
    } catch (exception) {
      print(exception);
    }
  }
}
