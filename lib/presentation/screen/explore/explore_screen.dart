import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class Curso {
  //final String? title;
  //final String? caption;
  final String imgUrl;

  Curso(
    //this.title,
    //this.caption,
    this.imgUrl
  );
}

final slides = <Curso> [
  Curso('assets/images/curso1.PNG'),
  Curso('assets/images/curso2.PNG'),
  Curso('assets/images/curso3.PNG'),

];

final sectionInformatica = <Curso> [
  Curso('assets/images/icurso1.PNG'),
  Curso('assets/images/icurso2.PNG'),
  Curso('assets/images/icurso3.PNG'),
   Curso('assets/images/icurso4.PNG'),

];

final sectionMatematicas = <Curso> [
  Curso('assets/images/mcurso1.PNG'),
  Curso('assets/images/mcurso2.PNG'),
  Curso('assets/images/mcurso3.PNG'),
  Curso('assets/images/mcurso4.PNG'),

];


class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SectionCarousel(
                  title: 'Cursos destacados',
                  items: slides,
                  height: 250.5,
                  autoPlay: true,
                  viewportFraction: 0.8,
                ),
                SectionCarousel(
                  title: 'Informatica',
                  items: sectionInformatica,
                ),
                SectionCarousel(
                  title: 'Matematicas',
                  items: sectionMatematicas,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SectionCarousel extends StatelessWidget {
  final String title;
  final List<Curso> items;
  final double height;
  final bool autoPlay;
  final double viewportFraction;
  

  const SectionCarousel({
    super.key,
    required this.title, 
    required this.items,
    this.height = 160.0,
    this.autoPlay = false,
    this.viewportFraction = 0.5,
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title),
        ),
        CarouselSlider(
          items: items.map((curso) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(curso.imgUrl),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: height,
            enlargeCenterPage: true,
            autoPlay: autoPlay,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 600),
            viewportFraction: viewportFraction,
          ),
        ),
      ],
    );
  }
}