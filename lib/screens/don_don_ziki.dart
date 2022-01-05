import 'package:flutter/material.dart';
import 'dart:math';

class ZikiGame extends StatefulWidget {
  const ZikiGame({Key? key}) : super(key: key);

  @override
  State<ZikiGame> createState() => _ZikiGameState();
}

class _ZikiGameState extends State<ZikiGame> {
  int _playerScore = 0;
  String _playerImage = "stone";
  int _botScore = 0;
  String _botImage = "stone";
  final List<String> _choices = ["stone", "scissors", "paper"];

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
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: MediaQuery.of(context).size.width * 0.05,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: redBot(context),
          ),
          const Divider(
            color: Colors.green,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Expanded(
            flex: 6,
            child: bluePlayer(context),
          ),
          Expanded(
            flex: 2,
            child: bottomButtons(),
          ),
        ],
      ),
    );
  }

  Container redBot(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
          left: MediaQuery.of(context).size.width * 0.05,
        ),
        child: Text(
          "Bot:",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width * 0.07,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.redAccent,
        image: DecorationImage(
          image: AssetImage("./assets/$_botImage.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Container bluePlayer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
          left: MediaQuery.of(context).size.width * 0.05,
        ),
        child: Text(
          "You:",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width * 0.07,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blueAccent,
        image: DecorationImage(
          image: AssetImage("./assets/$_playerImage.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Row bottomButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(
              MediaQuery.of(context).size.width * 0.2,
              MediaQuery.of(context).size.height * 0.1,
            ),
            primary: Colors.green,
            elevation: 0,
          ),
          child: Icon(
            Icons.refresh,
            size: MediaQuery.of(context).size.width * 0.1,
          ),
          onPressed: () {
            _playerScore = 0;
            _botScore = 0;
            _playerImage = "stone";
            _botImage = "stone";
            setState(() {});
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            primary: Colors.transparent,
            onPrimary: Colors.green,
            shadowColor: Colors.transparent,
            elevation: 0,
          ),
          child: Image.asset(
            "./assets/stone.png",
            fit: BoxFit.cover,
          ),
          onPressed: () {
            _playerImage = "stone";
            _botImage = _choices[Random().nextInt(3)];
            backend(_playerImage, _botImage);
            setState(() {});
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            primary: Colors.transparent,
            onPrimary: Colors.green,
            shadowColor: Colors.transparent,
            elevation: 0,
          ),
          child: Image.asset(
            "./assets/scissors.png",
            fit: BoxFit.cover,
          ),
          onPressed: () {
            _playerImage = "scissors";
            _botImage = _choices[Random().nextInt(3)];
            backend(_playerImage, _botImage);
            setState(() {});
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            primary: Colors.transparent,
            onPrimary: Colors.green,
            shadowColor: Colors.transparent,
            elevation: 0,
          ),
          child: Image.asset(
            "./assets/paper.png",
            fit: BoxFit.cover,
          ),
          onPressed: () {
            _playerImage = "paper";
            _botImage = _choices[Random().nextInt(3)];
            backend(_playerImage, _botImage);
            setState(() {});
          },
        ),
      ],
    );
  }

  void backend(String player, String bot) {
    if (player == "stone" && bot == "scissors") {
      _playerScore++;
    } else if (player == "stone" && bot == "paper") {
      _botScore++;
    } else if (player == "scissors" && bot == "stone") {
      _botScore++;
    } else if (player == "scissors" && bot == "paper") {
      _playerScore++;
    } else if (player == "paper" && bot == "stone") {
      _playerScore++;
    } else if (player == "paper" && bot == "scissors") {
      _botScore++;
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
            actions: <Widget>[
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
                  _playerImage = "stone";
                  _botImage = "stone";
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
