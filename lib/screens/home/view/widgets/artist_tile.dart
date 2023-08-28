import 'package:flutter/material.dart';
import '../../../../utils/value.dart';

class ArtistTile extends StatelessWidget {
  final String title;
  final int imageID;

  const ArtistTile({super.key, required this.title, required this.imageID});

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
      ],
    );
  }
}
