// material
import 'package:flutter/material.dart';
import 'package:great_talk/common/colors.dart';

final List<BottomNavigationBarItem> bnbElements = [
  const BottomNavigationBarItem(
      label: 'ホーム',
      icon: Icon(
        Icons.home,
        color: kSecondaryColor,
      )),
  const BottomNavigationBarItem(
      label: '人気',
      icon: Icon(
        Icons.stars,
        color: kSecondaryColor,
      )),
  const BottomNavigationBarItem(
      label: '最新',
      icon: Icon(
        Icons.update,
        color: kSecondaryColor,
      )),
  const BottomNavigationBarItem(
      label: '課金',
      icon: Icon(
        Icons.subscriptions,
        color: kSecondaryColor,
      )),
];
