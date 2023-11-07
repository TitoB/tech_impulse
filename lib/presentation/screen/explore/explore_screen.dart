import 'package:flutter/material.dart';
import 'package:tech_impulse/data/data_cursos.dart';
import 'package:tech_impulse/presentation/widget/cursos/cursos_carusel.dart';

class ExploreScreen extends StatelessWidget {

  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final categorias = ['Destacado', 'Informatica', 'Matematicas']; //se declara el nombre de la categoria tiene que ser igual al nom de categoria del curso
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              categorias.map((categoria) {    //se identifica el nombre de categoria del curso y se agrega a su seccion especifica
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          categoria, 
                          style: titleStyle,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),

                     ExploreSCarusel(cursos: destacado, categoria: categoria),
                  ]
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}