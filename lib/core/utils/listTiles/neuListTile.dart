

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class NeuListTileOne extends StatelessWidget {
  final IconData icon;
  final String image;
  final String title;
  final Widget trailing;
  final bool isIconPresent;
  NeuListTileOne(
      {required this.icon, required this.title, required this.trailing, this.isIconPresent = true, required this.image});
  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w,top: 15.h, bottom: 15.h),
      child: Container(
        width: sizeWidth,
        height: 25,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(image, height: sizeHeight >= 700 ? 20 : 16,width: sizeHeight >= 700 ? 20 : 16,),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: sizeHeight >= 700 ? 14.sp : 12.sp,
                      fontWeight: FontWeight.w500,),
                  ),
                ),
              ],
            ),
            isIconPresent
                ? Image.asset("assets/trailingArrow.png", color: Colors.white, height: 12, width: 12,): trailing,
          ],
        ),
      ),
    );
  }
}

