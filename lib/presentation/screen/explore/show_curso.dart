import 'package:flutter/material.dart';
import 'package:tech_impulse/infraestructure/models/model_cursos.dart';
import 'package:video_player/video_player.dart';

class ShowCurso extends StatefulWidget {
  final Curso destacado;
  const ShowCurso({super.key, required this.destacado});

  @override
  _ShowCursoState createState() => _ShowCursoState();

}

class _ShowCursoState extends State<ShowCurso> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    try {
      _videoPlayerController = VideoPlayerController.asset(
          widget.destacado.videoUrl)
        ..initialize().then((_) {
          setState(() {});
        });
    } catch (e) {
      print("Error al cargar el video: $e");
    }
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 85.5,
        title: Text(widget.destacado.title, style: titleStyle.titleLarge),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.destacado.title, 
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    )

                  ),
                  const SizedBox(height: 15),

                  const Text(
                    'Descripción:',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      )
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.destacado.description, 
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    )
                  ),
                  const SizedBox(height: 15),

                  Text(
                    '\$${widget.destacado.price}', 
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 22,
                    )
                  ),
                ]
              ),
            ),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _videoPlayerController.value.isPlaying
              ? _videoPlayerController.pause()
              : _videoPlayerController.play();
          });
        },
        child: Icon(
          _videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
      
    );
  }
}
