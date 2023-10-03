import 'package:flutter/material.dart';

class BottomBarItem {
  final String title;
  final String link;
  final IconData icon;

  const BottomBarItem({
    required this.title,
    required this.link,
    required this.icon
  }); 
}

const appMenuItmes = <BottomBarItem>[
  BottomBarItem(
    title: '', 
    link: '/', 
    icon: Icons.travel_explore_outlined,
    ),
];