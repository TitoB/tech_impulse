

class Portada {
  final String title;
  final String caption;
  final String imgUrl;

  Portada(
    this.title,
    this.caption,
    this.imgUrl
  );
}

final slides = <Portada> [
  Portada('Curso 1', '.', 'assets/images/1.jpeg'),
  Portada('Curso 2', '.', 'assets/images/2.jpeg'),
  Portada('¡Curso 3', '.', 'assets/images/3.jpeg'),

];
