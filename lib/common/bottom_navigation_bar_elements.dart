// material
import 'package:flutter/material.dart';
import 'package:great_talk/common/colors.dart';

final List<BottomNavigationBarItem> bnbElements = [
  const BottomNavigationBarItem(
      label: 'Timeline',
      icon: Icon(
        Icons.home,
        color: kSecondaryColor,
      )),
  const BottomNavigationBarItem(
      label: 'Ranking',
      icon: Icon(
        Icons.stars,
        color: kSecondaryColor,
      )),
  const BottomNavigationBarItem(
      label: 'Latest',
      icon: Icon(
        Icons.update,
        color: kSecondaryColor,
      )),
  const BottomNavigationBarItem(
      label: 'Plans',
      icon: Icon(
        Icons.subscriptions,
        color: kSecondaryColor,
      )),
  const BottomNavigationBarItem(
      label: 'Profile',
      icon: Icon(
        Icons.settings,
        color: kSecondaryColor,
      )),
];
