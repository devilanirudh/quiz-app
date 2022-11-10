import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class results extends StatelessWidget {
  final int resultscore;
  final Function resethandler;
  results(this.resultscore, this.resethandler);
  String get resultphrase {
    String resulttext;
    if (resultscore == 80) {
      resulttext = 'you passed with flying colors';
    }
    if (resultscore <= 40) {
      resulttext = 'you can do better';
    }
    if (resultscore <= 20) {
      resulttext = 'try again';
    } else {
      resulttext = (resultscore.toString());
    }
    return resulttext;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(resultphrase, style: TextStyle(fontSize: 36)),
          ElevatedButton(
            child: Text('restart quiz!'),
            onPressed: () => {
              resethandler(),
              AudioPlayer().play(AssetSource('audio/KBC.mp3')),
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
          ElevatedButton(onPressed: null, child: Text(resultscore.toString())),
        ],
      ),
    );
  }
}
