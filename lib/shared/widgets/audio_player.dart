import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class LocalAudio extends StatefulWidget {
  const LocalAudio({super.key});

  @override
  _LocalAudioState createState() => _LocalAudioState();
}

class _LocalAudioState extends State<LocalAudio> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  final Map<String, String> _audioUrls = {
    'أذكار الصباح والمساء': 'http://www.hisnmuslim.com/audio/ar/ar_7esn_AlMoslem_by_Doors_028.mp3',
    // 'أذكار المساء': 'http://www.hisnmuslim.com/audio/ar/ar_7esn_AlMoslem_by_Doors_016.mp3',
    // 'رقية شرعية': 'https://server11.mp3quran.net/yasser/000.mp3',
    // 'سورة البقرة': 'https://server11.mp3quran.net/yasser/002.mp3',
    // 'سورة الكهف': 'https://server11.mp3quran.net/yasser/018.mp3',
  };
  String? _selectedAudioName;
  String? _selectedAudioUrl;

  @override
  void initState() {
    super.initState();

    _selectedAudioName = _audioUrls.keys.first;
    _selectedAudioUrl = _audioUrls.values.first;

    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          _isPlaying = state == PlayerState.playing;
        });
      }
    });

    _audioPlayer.onDurationChanged.listen((newDuration) {
      if (mounted) {
        setState(() {
          _duration = newDuration;
        });
      }
    });

    _audioPlayer.onPositionChanged.listen((newPosition) {
      if (mounted) {
        setState(() {
          _position = newPosition;
        });
      }
    });
  }

  Future<void> _play() async {
    if (_selectedAudioUrl == null) return;

    if (kIsWeb) {
      // For web, stream directly from the URL
      await _audioPlayer.play(UrlSource(_selectedAudioUrl!));
    } else {
      // For mobile, use the cache
      final fileInfo = await DefaultCacheManager().getFileFromCache(_selectedAudioUrl!);
      if (fileInfo != null) {
        await _audioPlayer.play(DeviceFileSource(fileInfo.file.path));
      } else {
        final file = await DefaultCacheManager().getSingleFile(_selectedAudioUrl!);
        await _audioPlayer.play(DeviceFileSource(file.path));
      }
    }
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withAlpha(204), // Changed to theme primary color
              borderRadius: BorderRadius.circular(20),
            ),
            child: DropdownButton<String>(
              value: _selectedAudioName,
              dropdownColor: Theme.of(context).colorScheme.primary, // Changed to theme primary color
              style: const TextStyle(color: Colors.white, fontSize: 18),
              icon: Icon(Icons.arrow_drop_down, color: Theme.of(context).colorScheme.secondary), // Changed to theme secondary color
              underline: Container(),
              onChanged: (String? newValue) async {
                if (newValue == null) return;
                await _audioPlayer.stop();
                setState(() {
                  _selectedAudioName = newValue;
                  _selectedAudioUrl = _audioUrls[newValue];
                  _position = Duration.zero;
                  _duration = Duration.zero;
                });
                await _play();
              },
              items: _audioUrls.keys.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 50),
          Slider(
            min: 0,
            max: _duration.inSeconds.toDouble(),
            value: _position.inSeconds.toDouble(),
            onChanged: (value) async {
              final position = Duration(seconds: value.toInt());
              await _audioPlayer.seek(position);
            },
            activeColor: Theme.of(context).colorScheme.secondary, // Added for theme consistency
            inactiveColor: Theme.of(context).colorScheme.secondary.withOpacity(0.3), // Added for theme consistency
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_formatDuration(_position), style: const TextStyle(color: Colors.white)),
                Text(_formatDuration(_duration - _position), style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Theme.of(context).colorScheme.primary, // Changed to theme primary color
                child: IconButton(
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Theme.of(context).colorScheme.secondary, // Changed to theme secondary color
                  ),
                  iconSize: 50,
                  onPressed: () {
                    if (_isPlaying) {
                      _audioPlayer.pause();
                    } else {
                      _play();
                    }
                  },
                ),
              ),
              const SizedBox(width: 20),
              CircleAvatar(
                radius: 35,
                backgroundColor: Theme.of(context).colorScheme.primary, // Changed to theme primary color
                child: IconButton(
                  icon: Icon(Icons.stop,
                    color: Theme.of(context).colorScheme.secondary,), // Changed to theme secondary color
                  iconSize: 50,
                  onPressed: () {
                    _audioPlayer.stop();
                    setState(() {
                      _position = Duration.zero;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
