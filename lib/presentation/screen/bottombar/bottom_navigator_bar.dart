import 'package:flutter/material.dart';



class BottomBarNav extends StatefulWidget {
  const BottomBarNav({super.key});

  @override
  State<BottomBarNav> createState() => _BottomBarNav();
}

class _BottomBarNav extends State<BottomBarNav> {
  int CurrentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
    NavigationDestinationLabelBehavior.alwaysShow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: labelBehavior,
        selectedIndex: CurrentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            CurrentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.rocket_launch_sharp),
            label: 'Explorar',
          ),
          NavigationDestination(
            icon: Icon(Icons.search), 
            label: 'Buscar', 
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite), 
            label: 'Wishlist', 
          ),
          NavigationDestination(
            icon: Icon(Icons.person), 
            label: 'Perfil',
          ),
        ],
      ),
    );
  }   
 
}