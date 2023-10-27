class Curso {
  final int id;
  final String title;
  final String description;
  final String imgUrl;
  final String videoUrl;
  final double price;

  const Curso({
    required this.id,
    required this.title,
    required this.description,
    required this.imgUrl,
    required this.videoUrl,
    required this.price,
  });

  factory Curso.fromJson(Map<String, dynamic> json)=> Curso(
    id: json["id"],
    title: json["title"], 
    description : json["description"], 
    imgUrl: json["imgUrl"],
    videoUrl: json["videoUrl"],
    price: json["price"], 
    ); 

  Map<String, dynamic> toJson() =>{
    "id": id,
    "title": title,
    "description": description,
    "imgUrl": imgUrl,
    "videoUrl": videoUrl,
    "price": price,
  };
  Curso copy() => Curso(
    id: id,
    title: title, 
    description: description, 
    imgUrl: imgUrl,
    videoUrl: videoUrl,
    price: price, 
  );
}

