import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tech_impulse/infraestructure/models/model_cursos.dart';
import 'package:tech_impulse/presentation/screen/explore/show_curso.dart';

class ExploreSCarusel extends StatefulWidget {
  final List<Curso> cursos;
  final String categoria;

  const ExploreSCarusel({
    Key? key,
    required this.cursos,
    required this.categoria,
    }):super(key: key);

  @override
  State<ExploreSCarusel> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreSCarusel> {
  @override
  Widget build(BuildContext context) {
    final filtrarCategoria = widget.cursos.where((curso) => curso.categoria == widget.categoria).toList(); //Se identifica la categoria a la que pertenece

    return SizedBox(
      child: Column(
        children: [
          //SizedBox(height: 7.5),
          CarouselSlider.builder(
            itemCount: filtrarCategoria.length, 
            itemBuilder: (context, index, realIndex){
              final curso = filtrarCategoria[index];
              return SectionCarousel(destacado: curso);
            }, 
            options: CarouselOptions(
              height: 270.0,
              autoPlay: false,
              autoPlayCurve: Curves.easeInOut,
              //enlargeCenterPage: true,
              //autoPlayInterval: Duration(seconds: 3),
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
    final textStyles = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 325,
            height: 175,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: InkWell(
                onTap: () {
                  destacado.copy();
                  Navigator.of(context).push(MaterialPageRoute(builder:
                  (context) => ShowCurso(destacado: destacado,)));
                },
                child: FadeInImage(
                  placeholder: const AssetImage("assets/loading1.gif"),
                  image: AssetImage(destacado.imgUrl),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          //titulo
          SizedBox(
            width: 325,
            child: Text(
              destacado.title,
              maxLines: 2,
              style: textStyles.titleSmall,
            ),
          ),
          const SizedBox(height: 5),
          //precio
          SizedBox(
            width: 325,
            child: Text(
              '\$${destacado.price}',
              maxLines: 2,
              style: textStyles.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}