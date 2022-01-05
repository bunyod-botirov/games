import 'package:flutter/material.dart';

class RacingGame extends StatefulWidget {
  const RacingGame({Key? key}) : super(key: key);

  @override
  State<RacingGame> createState() => _RacingGameState();
}

class _RacingGameState extends State<RacingGame> {
  int _playerScore = 0;
  int _botScore = 0;
  double _player = 0.55;
  double _bot = 0.55;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text("Don Don Ziki"),
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
          Expanded(
            flex: 5,
            child: cars(context),
          ),
          Expanded(
            flex: 1,
            child: buttons(context),
          ),
        ],
      ),
    );
  }

  Column cars(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        const Divider(
          color: Colors.black,
          thickness: 2,
          height: 0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * _player),
              child: const Icon(
                Icons.stay_current_portrait,
                size: 50,
                color: Colors.red,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * _bot),
              child: const Icon(
                Icons.stay_current_portrait,
                size: 50,
                color: Colors.blue,
              ),
            ),
          ],
        )
      ],
    );
  }

  Row buttons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          child: const Icon(
            Icons.gamepad,
            size: 50,
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            fixedSize: Size(
              MediaQuery.of(context).size.width * 0.4,
              MediaQuery.of(context).size.height * 0.15,
            ),
          ),
          onPressed: () {
            _player -= 0.02;
            backend();
            setState(() {});
          },
        ),
        ElevatedButton(
          child: const Icon(
            Icons.gamepad,
            size: 50,
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            fixedSize: Size(
              MediaQuery.of(context).size.width * 0.4,
              MediaQuery.of(context).size.height * 0.15,
            ),
          ),
          onPressed: () {
            _bot -= 0.02;
            backend();
            setState(() {});
          },
        ),
      ],
    );
  }

  void backend() {
    if (_player <= 0) {
      _playerScore++;
      _player = 0.55;
      _bot = 0.55;
    } else if (_bot <= 0) {
      _botScore++;
      _player = 0.55;
      _bot = 0.55;
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
