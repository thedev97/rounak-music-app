import '../../../../utils/value.dart';
import 'package:flutter/material.dart';

class PlaylistTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final int imageID;

  const PlaylistTile(
      {required this.title,
      required this.subTitle,
      required this.imageID,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: 200,
          child: Image.network('https://picsum.photos/id/$imageID/200'),
        ),
        AppTextStyles.defaultText(title),
        AppTextStyles.greyText(subTitle)
      ],
    );
  }
}
