import 'package:flutter/material.dart';

class results extends StatelessWidget {
  final int resultscore;
  final Function resethandler;
  results(this.resultscore, this.resethandler);
  String get resultphrase {
    String resulttext;
    if (resultscore <= 12) {
      resulttext = 'good';
    }
    if (resultscore <= 24) {
      resulttext = 'bad';
    }
    if (resultscore <= 34) {
      resulttext = 'better';
    } else {
      resulttext = 'worst';
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
            onPressed: resethandler,
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
