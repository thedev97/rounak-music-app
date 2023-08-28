import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ScreenController extends GetxController {
  var currentIndex = 0.obs;
  var searchButtonClicked = false.obs;

  void setIndex(int value) {
    currentIndex.value = value;
    update();
  }
}
