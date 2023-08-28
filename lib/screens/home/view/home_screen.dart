import 'widgets/header.dart';
import 'package:get/get.dart';
import '../model/sections.dart';
import '../../../utils/value.dart';
import 'package:flutter/material.dart';
import 'widgets/dashboard_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Sections sections = Sections();
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Stack(
        children: [
          Container(
            height: Get.height,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.purple, AppColors.black],
                    stops: [0.0, 0.3])),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderBar(),
                DashboardSection(
                    sectionTitle: 'Your Top Shows',
                    widgetList: sections.topShows),
                DashboardSection(
                  sectionTitle: 'Recent Music',
                  widgetList: sections.recentMusic,
                ),
                DashboardSection(
                  sectionTitle: 'Jump Back In',
                  widgetList: sections.jumpBackIn,
                ),
                DashboardSection(
                  sectionTitle: 'Recommended For Today',
                  widgetList: sections.recommendedForToday,
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
