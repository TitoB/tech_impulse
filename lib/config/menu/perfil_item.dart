import 'package:flutter/material.dart';

class PerfilItem {
  final String title;
  final String link;
  final IconData icon;

  const PerfilItem({
    required this.title,
    required this.link,
    required this.icon
  }); 
}

const appMenuItmes = <PerfilItem>[
  PerfilItem(
    title: '', 
    link: '/', 
    icon: Icons.travel_explore_outlined,
    ),
];