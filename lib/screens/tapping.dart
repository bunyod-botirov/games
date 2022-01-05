import 'package:flutter/material.dart';

class TappingGame extends StatefulWidget {
  const TappingGame({Key? key}) : super(key: key);

  @override
  State<TappingGame> createState() => _TappingGameState();
}

class _TappingGameState extends State<TappingGame> {
  int _playerScore = 0;
  int _botScore = 0;
  double _player = 0.44;
  double _bot = 0.44;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text("Tapping Game"),
        actions: <Widget>[
          Center(
            widthFactor: 1.2,
            child: Text(
              "Y: $_playerScore | B: $_botScore",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: Icon(
              Icons.gamepad,
              size: 100,
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              fixedSize: Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * _bot,
              ),
            ),
            onPressed: () {
              _bot += 0.02;
              _player -= 0.02;
              backend();
              setState(() {});
            },
          ),
          Spacer(),
          ElevatedButton(
            child: Icon(
              Icons.gamepad,
              size: 100,
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              fixedSize: Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * _player,
              ),
            ),
            onPressed: () {
              _player += 0.02;
              _bot -= 0.02;
              backend();
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  void backend() {
    if (_player <= 0.1) {
      _botScore++;
      _player = 0.44;
      _bot = 0.44;
    } else if (_bot <= 0.1) {
      _playerScore++;
      _player = 0.44;
      _bot = 0.44;
    }

    if (_playerScore >= 3 || _botScore >= 3) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: (_playerScore >= _botScore)
                ? const Text("You Win!")
                : const Text("You Lose!"),
            actions: [
              TextButton(
                child: const Text("Quit"),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text("Play Again"),
                onPressed: () {
                  _playerScore = 0;
                  _botScore = 0;
                  setState(() {});
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }
}
