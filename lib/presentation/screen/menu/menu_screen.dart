
import 'package:flutter/material.dart';
import 'package:tech_impulse/presentation/widget/shared/bottom_bar.dart';

class MenuScreen extends StatelessWidget {
  static const String name = 'menu_screen';

  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomBarNav(),
    );
  }
}


