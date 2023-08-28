import 'package:flutter/material.dart';
import 'package:rounakmusicplayerapp/utils/value.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppTextStyles.defaultPadding,
          vertical: AppTextStyles.defaultPadding*2.5),
      child: Row(
        children: [
          AppTextStyles.titleText('Good Evening'),
          Spacer(),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppTextStyles.defaultPadding),
            child: Icon(
              Icons.history,
              color: Colors.white,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppTextStyles.defaultPadding),
            child: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
