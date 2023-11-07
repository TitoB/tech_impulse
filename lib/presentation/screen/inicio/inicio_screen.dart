import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tech_impulse/presentation/screen/menu/menu_screen.dart';

class SlideInicio {
  final String title;
  final String caption;
  final String imgUrl;

  SlideInicio(
    this.title,
    this.caption,
    this.imgUrl
  );
}

final slides = <SlideInicio> [
  SlideInicio('¡Aprende Más Rapido!', 'No importa desde donde te encuentres, En tu movil tienes lo necesario para realizar los cursos.', 'assets/images/1.jpeg'),
  SlideInicio('¡No importa la hora!', 'Tu dispones del tiempo para estudiar.', 'assets/images/2.jpeg'),
  SlideInicio('¡No Dejes de Aprender!', 'No importa desde donde te encuentres.', 'assets/images/3.jpeg'),

];

class InicioScreen extends StatefulWidget {
  static const String name = 'start_screen';

  const InicioScreen({super.key});

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  final PageController pageviewController = PageController();
  bool endRached = false;

  @override
  void initState(){
    super.initState();

    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;
      if ( !endRached && page >= (slides.length - 1.5)) {
        setState(() {
          endRached = true;
        });
      }
    });
  }
  @override
  void dispose(){
    pageviewController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map(
              (slideData) => _Slide(
                title: slideData.title,
                caption: slideData.caption,
                imageUrl: slideData.imgUrl,
              ),
          ).toList(),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            child: FadeInRight(
              from: 15,
              child: 
              ElevatedButton.icon(
              onPressed: (){
                
              }, 
              icon: const Icon(Icons.rocket_launch_sharp), 
              label: const Text('Iniciar Sesión'),
              ),
            ),
          ),
        
          Positioned(
            bottom: 50,
            right: 20,
            child: FadeInRight(
              from: 15,
              child: 
              ElevatedButton.icon(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder:
                (context) => const MenuScreen()));
              }, 
              icon: const Icon(Icons.rocket_launch_sharp), 
              label: const Text('Explorar'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage( imageUrl )),
            const SizedBox(height: 20),
            Text( title, style: titleStyle),
            const SizedBox(height: 10),
            Text( caption, style: captionStyle),
          ],
          ),
      ),
    );
  }
}



