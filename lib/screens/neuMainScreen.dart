
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/cupertino.dart';

class NeuMainScreen extends StatefulWidget {
  const NeuMainScreen({Key? key}) : super(key: key);

  @override
  _NeuMainScreenState createState() => _NeuMainScreenState();
}

class _NeuMainScreenState extends State<NeuMainScreen> {

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff202427),
    );
  }
}
