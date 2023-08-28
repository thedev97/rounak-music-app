import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/value.dart';

class DashboardSection extends StatelessWidget {
  final String sectionTitle;
  final List<Widget>? widgetList;

  const DashboardSection(
      {super.key, required this.sectionTitle, this.widgetList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: AppTextStyles.defaultPadding,
              bottom: AppTextStyles.defaultPadding),
          child: AppTextStyles.titleText(sectionTitle),
        ),
        Container(
          height: Get.height * 0.3,
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowIndicator();
              return true;
            },
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: RangeMaintainingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: AppTextStyles.defaultPadding),
                itemBuilder: (ctx, i) {
                  return widgetList?[i];
                },
                separatorBuilder: (BuildContext ctx, int i) {
                  return SizedBox(
                    width: AppTextStyles.defaultPadding,
                  );
                },
                itemCount: widgetList?.length ?? 0),
          ),
        )
      ],
    );
  }
}
