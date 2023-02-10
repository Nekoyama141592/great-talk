// material
import 'package:flutter/material.dart';
import 'package:great_talk/common/colors.dart';

final List<BottomNavigationBarItem> bnbElements = [
  const BottomNavigationBarItem(
    label: 'Chat',
    icon: Icon(Icons.chat,color: kSecondaryColor,)
  ),
  const BottomNavigationBarItem(
    label: 'Plans',
    icon: Icon(Icons.subscriptions,color: kSecondaryColor,)
  ),
];

