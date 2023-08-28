import 'package:flutter/material.dart';
import '../view/widgets/artist_tile.dart';
import '../view/widgets/playlist_tile.dart';

class Sections {
  List<Widget> topShows = [
    PlaylistTile(
      title: 'Monday Motivation',
      subTitle: 'Show Motivational',
      imageID: 1057,
    ),
    PlaylistTile(
      title: 'Goals Billionaire',
      subTitle: 'Tolu Dave',
      imageID: 239,
    ),
    PlaylistTile(
      title: 'Morning Meal',
      subTitle: 'Star City',
      imageID: 265,
    ),
  ];

  List<Widget> recentMusic = [
    PlaylistTile(
      title: 'Top Hits Hindi',
      subTitle: 'Show Motivational',
      imageID: 1057,
    ),
    ArtistTile(
      title: 'Dino James',
      imageID: 177,
    ),
    ArtistTile(
      title: 'Linkin Park',
      imageID: 325,
    ),
  ];

  List<Widget> recommendedForToday = [
    PlaylistTile(
        title: 'Hancock', subTitle: 'Single by Dino James', imageID: 336),
    PlaylistTile(
        title: 'Autobiography', subTitle: 'Single by Loka', imageID: 1005),
    PlaylistTile(title: 'Sunn Na', subTitle: 'Single by Bali', imageID: 338),
    PlaylistTile(
        title: 'Say My Name', subTitle: 'Single by KR\$NA', imageID: 334),
  ];

  List<Widget> jumpBackIn = [
    PlaylistTile(
        title: 'Kgf Chapter 1',
        subTitle: 'Ravi Basrur, Tanishk Bagchi',
        imageID: 1082),
    PlaylistTile(title: 'Kaha Par Hai', subTitle: 'MC Stan', imageID: 30),
    PlaylistTile(title: 'Tanhaji', subTitle: 'Mehul Vyas', imageID: 299),
  ];
}
