import 'package:get/get.dart';
import '../../../utils/value.dart';
import 'package:flutter/material.dart';
import '../../home/view/home_screen.dart';
import '../../search/view/search_screen.dart';
import '../controller/screen_controller.dart';
import '../../your_library/view/library_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controller = Get.put(ScreenController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          selectedFontSize: 12,
          currentIndex: controller.currentIndex.value,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu), label: 'Your Library'),
          ],
          onTap: (index) => controller.setIndex(index),
        ),
      ),
      body: Stack(
        children: [
          Obx(() {
            switch (controller.currentIndex.value) {
              case 0:
                return HomeScreen();
              case 1:
                return SearchScreen();
              case 2:
                return LibraryScreen();
              default:
                return Text('No Page');
            }
          }),
        ],
      ),
    );
  }
}
