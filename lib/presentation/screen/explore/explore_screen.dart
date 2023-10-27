import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tech_impulse/data/data_cursos.dart';
import 'package:tech_impulse/infraestructure/models/model_cursos.dart';
import 'package:tech_impulse/presentation/screen/explore/show_curso.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      body: Column(
        children: [
          SizedBox(height: 30),
          CarouselSlider.builder(
            itemCount: destacado.length, 
            itemBuilder: (context, index, realIndex){
              final carruselImage = destacado[index];
              return SectionCarousel(destacado: destacado[index]);
            }, 
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: true,
              autoPlayInterval: Duration(seconds: 3),
              scrollDirection: Axis.horizontal,
            )
          ),
        ]
      ),
    );
  }
}

class SectionCarousel extends StatelessWidget {
  final Curso destacado;
  const SectionCarousel({super.key, required this.destacado});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () {
            destacado.copy();
            Navigator.of(context).push(MaterialPageRoute(builder:
            (context) => ShowCurso(destacado: destacado,)));
          },
          child: FadeInImage(
            placeholder: const AssetImage("assets/loading1.gif"),
            image: AssetImage(destacado.imgUrl),
            fit: BoxFit.cover,
          ),
        ),
        ),
    );
  }
}