import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

typedef void OnError(Exception exception);

class LocalAudio extends StatefulWidget {
  LocalAudio({this.fileName});
  String fileName;

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

  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  String localFilePath;

/// audio button
  Widget _btn(Icon icon, VoidCallback onPressed) {
    return ButtonTheme(
      minWidth: 48.0,
      child: Container(
        width: 100,
        height: 45,
        child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: icon,
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            onPressed: onPressed),
      ),
    );
  }


  /// slider track
  Widget slider() {
    return Slider(
        activeColor: Theme.of(context).accentColor,
        inactiveColor: Colors.white,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });
  }

  /// drop down menu for azkar audio
  Widget listTile(){
    return ListTile(
      title: Text('أختار :', style: TextStyle(color: Theme.of(context).accentColor, fontSize: 25, fontWeight: FontWeight.bold),),
      trailing: DropdownButton<String>(
        // Must be one of items.value.
        style: TextStyle(color: Theme.of(context).accentColor, fontSize: 28, fontWeight: FontWeight.bold),
        value: btn1SelectedVal,
        onChanged: (String newValue) {
          setState(() {
            btn1SelectedVal = newValue;
          });
        },
        items: this._dropDownMenuItems,
      ),
    );
  }


  ///seek for audio by second
  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            image: DecorationImage(
              image: AssetImage("assets/images/a_ground.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              listTile(),
              SizedBox(
                height: 15,
              ),
              slider(),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                _btn(Icon(Icons.play_arrow), () => audioCache.play('$btn1SelectedVal.mp3')),
                _btn(Icon(Icons.pause), () => advancedPlayer.pause()),
                _btn(Icon(Icons.stop), () => advancedPlayer.stop()),
              ],)
            ],
          )
        ),
      ),
    );
  }
}
