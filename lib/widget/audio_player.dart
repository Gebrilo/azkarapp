import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

typedef void OnError(Exception exception);

class LocalAudio extends StatefulWidget {
  const LocalAudio({super.key});

  @override
  _LocalAudio createState() => _LocalAudio();
}

class _LocalAudio extends State<LocalAudio> {



  static const menuItems = <String>[
    'azkar-al-sbah',
    'azkar-al-masa',
  ];

  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  String btn1SelectedVal = 'azkar-al-sbah';

  Duration _duration = const Duration();
  Duration _position = const Duration();
  late AudioPlayer advancedPlayer;
  late AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.onDurationChanged.listen((d) => setState(() {
          _duration = d;
        }));

    advancedPlayer.onAudioPositionChanged.listen((p) => setState(() {
          _position = p;
        }));
  }

  String? localFilePath;

/// audio button
  Widget _btn(Icon icon, VoidCallback onPressed) {
    return SizedBox(
      width: 100,
      height: 45,
      child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              foregroundColor: Colors.white,
            ),
            child: icon,
            onPressed: onPressed),
      ),
    ;
  }


  /// slider track
  Widget slider() {
    return Slider(
        activeColor: Theme.of(context).colorScheme.secondary,
        inactiveColor: Colors.white,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            // value = value; // This line is redundant
          });
        });
  }

  /// drop down menu for azkar audio
  Widget listTile(){
    return ListTile(
      title: Text('أختار :', style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 25, fontWeight: FontWeight.bold),),
      trailing: DropdownButton<String>(
        // Must be one of items.value.
        style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 28, fontWeight: FontWeight.bold),
        value: btn1SelectedVal,
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              btn1SelectedVal = newValue;
            });
          }
        },
        items: _dropDownMenuItems,
      ),
    );
  }


  ///seek for audio by second
  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  @override
  void dispose() {
    advancedPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/a_ground.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              listTile(),
              const SizedBox(
                height: 15,
              ),
              slider(),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                _btn(const Icon(Icons.play_arrow), () => audioCache.play('$btn1SelectedVal.mp3')),
                _btn(const Icon(Icons.pause), () => advancedPlayer.pause()),
                _btn(const Icon(Icons.stop), () => advancedPlayer.stop()),
              ],)
            ],
          )
        ),
      ),
    );
  }
}
