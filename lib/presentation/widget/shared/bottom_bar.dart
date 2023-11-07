import 'package:flutter/material.dart';
import 'package:tech_impulse/presentation/screen/explore/explore_screen.dart';
import 'package:tech_impulse/presentation/screen/perfil/perfil_screen.dart';
import 'package:tech_impulse/presentation/screen/search/search_screen.dart';
import 'package:tech_impulse/presentation/screen/wishlist/wishlist_screen.dart';



class BottomBarNav extends StatefulWidget {
  const BottomBarNav({super.key});

  @override
  State<BottomBarNav> createState() => _BottomBarNav();
}

class _BottomBarNav extends State<BottomBarNav> {
  int currentIndex = 0;
  String appBatTitle = 'Explorar'; //se define explorar al iniciar la varaible

  NavigationDestinationLabelBehavior labelBehavior =
  NavigationDestinationLabelBehavior.alwaysShow;

  List<Widget> screens = [
    const ExploreScreen(),
    const SearchScreen(),
    const WishlisScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBatTitle),
        centerTitle: true,
        toolbarHeight: 85.5,
      ),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: labelBehavior,
        selectedIndex: currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
            switch (index) {
              case 0:
                  appBatTitle = 'Explorar';
                break;
              case 1:
                  appBatTitle = 'Buscar';
                break;
              case 2:
                  appBatTitle = 'Wishlist';
                break;
              case 3:
                  appBatTitle = 'Perfil';
                break;
              default:
            }
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