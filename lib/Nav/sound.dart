import 'package:flutter/material.dart';
import '../widget/audio_player.dart';

class Sound extends StatelessWidget {
  Sound({this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Align(alignment: Alignment.center, child: Text(title)),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            image: DecorationImage(
              image: AssetImage("assets/images/ground.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: LocalAudio(),
        ),
      ),
    );
  }
}
