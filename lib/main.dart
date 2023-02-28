import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MusicWidget());
}

class MusicWidget extends StatefulWidget {
  const MusicWidget({super.key});

  @override
  State<MusicWidget> createState() => _MusicWidgetState();
}

class _MusicWidgetState extends State<MusicWidget> {
  AudioPlayer player = AudioPlayer();

  void playMusic(int musicNumber) {
    player.play(AssetSource('tamer-$musicNumber.mp3'));
  }

  Expanded myButton(int musicNumber, String bottunText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(Color.fromARGB(255, 205, 104, 236)),
          ),
          onPressed: () {
            setState(() {
              player.dispose();
            });
            playMusic(musicNumber);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.music_note,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  bottunText,
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Cairo',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 237, 231, 238),
        appBar: AppBar(
          title: Text(
            'موسيقى',
            style: TextStyle(fontFamily: 'Cairo'),
          ),
          backgroundColor: Colors.purple,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            myButton(1, 'ناسيني ليه'),
            myButton(2, 'عيش بشوقك'),
            myButton(3, 'كفاياك اعذار'),
            myButton(4, 'حلم سنين'),
            myButton(5, 'وانت معايا'),
            myButton(6, 'وأخيرا'),
            myButton(7, 'لولاك حبيبي'),
          ],
        ),
      ),
    );
  }
}
