import 'package:flutter/material.dart';
import '../widget/audio_player.dart';

class Sound extends StatelessWidget {
  const Sound({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            image: const DecorationImage(
              image: AssetImage("assets/images/ground.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: const LocalAudio(),
        ),
      ),
    );
  }
}
