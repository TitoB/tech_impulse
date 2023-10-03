import 'package:flutter/material.dart';
import 'package:tech_impulse/presentation/screen/menu/menu_screen.dart';
//import 'package:go_router/go_router.dart';
//import 'package:tech_impulse/config/menu/menu_items.dart';


class StartScreen extends StatelessWidget {
  static const String name = 'start_screen';

  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _StartView(),
    );
  }
}

class _StartView extends StatelessWidget {
  const _StartView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(       //creamos una caja donde habra 3 contedores hijos
          height: 550,
          child: PageView(
            children: [
              Container(
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Contenido 1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.orange,
                child: const Center(
                  child: Text(
                    'Contenido 2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'Contenido 3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const _BottomButtons(),
      ],
    );
  }
}




class _BottomButtons extends StatelessWidget {
  const _BottomButtons({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Wrap(
          spacing: 40,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.login_outlined), 
              label: const Text('Sig in')
              ),
            ElevatedButton.icon(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder:
                (context) => const MenuScreen()));
              }, 
              icon: const Icon(Icons.rocket_launch_sharp), 
              label: const Text('Explorar')
              ),
          ],
        ),
      ),
    );
  }
} 

