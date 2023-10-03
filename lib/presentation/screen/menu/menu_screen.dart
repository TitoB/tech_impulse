import 'package:flutter/material.dart';
import 'package:tech_impulse/presentation/screen/bottombar/bottom_navigator_bar.dart';

class MenuScreen extends StatelessWidget {
  static const String name = 'menu_screen';
  
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: const BottomBarNav(),
    );
  }
}