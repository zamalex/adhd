import 'package:adhd/Utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:voice_message_package/voice_message_package.dart';

class NotificationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "you did agreat job",
          style: TextStyle(fontSize: 17),
        ),
        SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 90,
          // child: VoiceMessage(
          //   meBgColor: Constants.MAIN_COLOR,
          //   audioSrc: 'https://www.kozco.com/tech/piano2-CoolEdit.mp3',
          //   played: false, // To show played badge or not.
          //   me: true, // Set message side.
          //   onPlay: () {}, // Do something when voice played.
          // ),
          child: VoiceMessageView(
              backgroundColor: Constants.MAIN_COLOR,
              controller: VoiceController(
                audioSrc: 'https://www.kozco.com/tech/piano2-CoolEdit.mp3',
                maxDuration: const Duration(seconds: 3600),
                isFile: false,
                onComplete: () {},
                onPause: () {},
                onPlaying: () {},
              )),
        ),
      ],
    );
  }
}
