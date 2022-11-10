import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: 300.0,
          height: 50.0,
          child: ElevatedButton(
            child: Text(answerText),
            onPressed: () => {
              selectHandler(),
              AudioPlayer().play(AssetSource('KBCC.mp3')),
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return Color.fromARGB(255, 76, 54, 244);
                  return Color.fromARGB(255, 124, 187, 174);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
