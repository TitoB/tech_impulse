import 'package:go_router/go_router.dart';
import 'package:tech_impulse/presentation/screen/inicio/inicio_screen.dart';
import 'package:tech_impulse/presentation/screen/menu/menu_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: StartScreen.name,
      builder: (context, state) => const StartScreen(),
    ),
    GoRoute(
      path: '/menu',
      name: MenuScreen.name,
      builder: (context, state) => const MenuScreen(),
    ),
    // GoRoute(
    //   path: '/carusel',
    //   name: MenuScreen.name,
    //   builder: (context, state) => const MenuScreen(),
    // ),
    // GoRoute(
    //   path: '/wishlist',
    //   name: MenuScreen.name,
    //   builder: (context, state) => const MenuScreen(),
    // ),
    // GoRoute(
    //   path: '/search',
    //   name: MenuScreen.name,
    //   builder: (context, state) => const MenuScreen(),
    // ),
    // GoRoute(
    //   path: '/perfil',
    //   name: MenuScreen.name,
    //   builder: (context, state) => const MenuScreen(),
    // ),
  ],
);