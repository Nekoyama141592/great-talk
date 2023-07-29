// material
import 'package:flutter/material.dart';
import 'package:great_talk/common/colors.dart';

final List<BottomNavigationBarItem> bnbElements = [
  const BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(
        Icons.home,
        color: kSecondaryColor,
      )),
  const BottomNavigationBarItem(
      label: 'Search',
      icon: Icon(
        Icons.search,
        color: kSecondaryColor,
      )),
  const BottomNavigationBarItem(
      label: 'People',
      icon: Icon(
        Icons.chat,
        color: kSecondaryColor,
      )),
  const BottomNavigationBarItem(
      label: 'Plans',
      icon: Icon(
        Icons.subscriptions,
        color: kSecondaryColor,
      )),
  const BottomNavigationBarItem(
      label: 'Account',
      icon: Icon(
        Icons.settings,
        color: kSecondaryColor,
      )),
];
