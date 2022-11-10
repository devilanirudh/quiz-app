import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(answerText),
        onPressed: () => {
          selectHandler(),
          AudioPlayer().play(AssetSource('KBCC.mp3')),
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) return Colors.red;
              return Colors.green;
            },
          ),
        ),
      ),
    );
  }
}
