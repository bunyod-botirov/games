import 'package:flutter/material.dart';

class ToeGame extends StatefulWidget {
  const ToeGame({Key? key}) : super(key: key);

  @override
  State<ToeGame> createState() => _ToeGameState();
}

class _ToeGameState extends State<ToeGame> {
  Icon? _zero;
  Icon? _one;
  Icon? _two;
  Icon? _three;
  Icon? _four;
  Icon? _five;
  Icon? _six;
  Icon? _seven;
  Icon? _eight;
  int _playerScore = 0;
  int _botScore = 0;
  int _i = 0;
  List<int> _algoritm = [5, 5, 5, 5, 5, 5, 5, 5, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text("Tic Tac Toe"),
        actions: <Widget>[
          Center(
            widthFactor: 2,
            child: (_i % 2 == 0)
                ? const Icon(Icons.person)
                : const Icon(Icons.smart_toy),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: top(context),
          ),
          Expanded(
            flex: 7,
            child: bottom(),
          ),
        ],
      ),
    );
  }

  Column top(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ElevatedButton(
          child: Text(
            "Reset",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.07,
            ),
          ),
          style: ElevatedButton.styleFrom(
            fixedSize: Size(
              MediaQuery.of(context).size.width * 0.8,
              MediaQuery.of(context).size.height * 0.1,
            ),
          ),
          onPressed: () {
            reset();
            _playerScore = 0;
            _botScore = 0;
            setState(() {});
          },
        ),
        Text(
          "You: $_playerScore | Bot: $_botScore",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w500,
            fontSize: MediaQuery.of(context).size.width * 0.07,
          ),
        ),
      ],
    );
  }

  Column bottom() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              child: _zero,
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                fixedSize: Size(
                  MediaQuery.of(context).size.width * 0.3,
                  MediaQuery.of(context).size.width * 0.3,
                ),
                padding: const EdgeInsets.all(0),
              ),
              onPressed: () {
                if (_algoritm[0] == 5) {
                  _algoritm[0] = (_i % 2 == 0) ? 1 : 0;
                  _zero = (_algoritm[0] == 1)
                      ? Icon(
                          Icons.close,
                          size: MediaQuery.of(context).size.width * 0.25,
                        )
                      : Icon(
                          Icons.circle_outlined,
                          size: MediaQuery.of(context).size.width * 0.25,
                        );
                  _i++;
                  backend();
                  setState(() {});
                }
              },
            ),
            ElevatedButton(
              child: _one,
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                fixedSize: Size(
                  MediaQuery.of(context).size.width * 0.3,
                  MediaQuery.of(context).size.width * 0.3,
                ),
                padding: const EdgeInsets.all(0),
              ),
              onPressed: () {
                if (_algoritm[1] == 5) {
                  _algoritm[1] = (_i % 2 == 0) ? 1 : 0;
                  _one = (_algoritm[1] == 1)
                      ? Icon(
                          Icons.close,
                          size: MediaQuery.of(context).size.width * 0.25,
                        )
                      : Icon(
                          Icons.circle_outlined,
                          size: MediaQuery.of(context).size.width * 0.25,
                        );
                  _i++;
                  backend();
                  setState(() {});
                }
              },
            ),
            ElevatedButton(
              child: _two,
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                fixedSize: Size(
                  MediaQuery.of(context).size.width * 0.3,
                  MediaQuery.of(context).size.width * 0.3,
                ),
                padding: const EdgeInsets.all(0),
              ),
              onPressed: () {
                if (_algoritm[2] == 5) {
                  _algoritm[2] = (_i % 2 == 0) ? 1 : 0;
                  _two = (_algoritm[2] == 1)
                      ? Icon(
                          Icons.close,
                          size: MediaQuery.of(context).size.width * 0.25,
                        )
                      : Icon(
                          Icons.circle_outlined,
                          size: MediaQuery.of(context).size.width * 0.25,
                        );
                  _i++;
                  backend();
                  setState(() {});
                }
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              child: _three,
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                fixedSize: Size(
                  MediaQuery.of(context).size.width * 0.3,
                  MediaQuery.of(context).size.width * 0.3,
                ),
                padding: const EdgeInsets.all(0),
              ),
              onPressed: () {
                if (_algoritm[3] == 5) {
                  _algoritm[3] = (_i % 2 == 0) ? 1 : 0;
                  _three = (_algoritm[3] == 1)
                      ? Icon(
                          Icons.close,
                          size: MediaQuery.of(context).size.width * 0.25,
                        )
                      : Icon(
                          Icons.circle_outlined,
                          size: MediaQuery.of(context).size.width * 0.25,
                        );
                  _i++;
                  backend();
                  setState(() {});
                }
              },
            ),
            ElevatedButton(
              child: _four,
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                fixedSize: Size(
                  MediaQuery.of(context).size.width * 0.3,
                  MediaQuery.of(context).size.width * 0.3,
                ),
                padding: const EdgeInsets.all(0),
              ),
              onPressed: () {
                if (_algoritm[4] == 5) {
                  _algoritm[4] = (_i % 2 == 0) ? 1 : 0;
                  _four = (_algoritm[4] == 1)
                      ? Icon(
                          Icons.close,
                          size: MediaQuery.of(context).size.width * 0.25,
                        )
                      : Icon(
                          Icons.circle_outlined,
                          size: MediaQuery.of(context).size.width * 0.25,
                        );
                  _i++;
                  backend();
                  setState(() {});
                }
              },
            ),
            ElevatedButton(
              child: _five,
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                fixedSize: Size(
                  MediaQuery.of(context).size.width * 0.3,
                  MediaQuery.of(context).size.width * 0.3,
                ),
                padding: const EdgeInsets.all(0),
              ),
              onPressed: () {
                if (_algoritm[5] == 5) {
                  _algoritm[5] = (_i % 2 == 0) ? 1 : 0;
                  _five = (_algoritm[5] == 1)
                      ? Icon(
                          Icons.close,
                          size: MediaQuery.of(context).size.width * 0.25,
                        )
                      : Icon(
                          Icons.circle_outlined,
                          size: MediaQuery.of(context).size.width * 0.25,
                        );
                  _i++;
                  backend();
                  setState(() {});
                }
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              child: _six,
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                fixedSize: Size(
                  MediaQuery.of(context).size.width * 0.3,
                  MediaQuery.of(context).size.width * 0.3,
                ),
                padding: const EdgeInsets.all(0),
              ),
              onPressed: () {
                if (_algoritm[6] == 5) {
                  _algoritm[6] = (_i % 2 == 0) ? 1 : 0;
                  _six = (_algoritm[6] == 1)
                      ? Icon(
                          Icons.close,
                          size: MediaQuery.of(context).size.width * 0.25,
                        )
                      : Icon(
                          Icons.circle_outlined,
                          size: MediaQuery.of(context).size.width * 0.25,
                        );
                  _i++;
                  backend();
                  setState(() {});
                }
              },
            ),
            ElevatedButton(
              child: _seven,
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                fixedSize: Size(
                  MediaQuery.of(context).size.width * 0.3,
                  MediaQuery.of(context).size.width * 0.3,
                ),
                padding: const EdgeInsets.all(0),
              ),
              onPressed: () {
                if (_algoritm[7] == 5) {
                  _algoritm[7] = (_i % 2 == 0) ? 1 : 0;
                  _seven = (_algoritm[7] == 1)
                      ? Icon(
                          Icons.close,
                          size: MediaQuery.of(context).size.width * 0.25,
                        )
                      : Icon(
                          Icons.circle_outlined,
                          size: MediaQuery.of(context).size.width * 0.25,
                        );
                  _i++;
                  backend();
                  setState(() {});
                }
              },
            ),
            ElevatedButton(
              child: _eight,
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                fixedSize: Size(
                  MediaQuery.of(context).size.width * 0.3,
                  MediaQuery.of(context).size.width * 0.3,
                ),
                padding: const EdgeInsets.all(0),
              ),
              onPressed: () {
                if (_algoritm[8] == 5) {
                  _algoritm[8] = (_i % 2 == 0) ? 1 : 0;
                  _eight = (_algoritm[8] == 1)
                      ? Icon(
                          Icons.close,
                          size: MediaQuery.of(context).size.width * 0.25,
                        )
                      : Icon(
                          Icons.circle_outlined,
                          size: MediaQuery.of(context).size.width * 0.25,
                        );
                  _i++;
                  backend();
                  setState(() {});
                }
              },
            ),
          ],
        ),
      ],
    );
  }

  void backend() {
    if (_algoritm[0] == 1 && _algoritm[1] == 1 && _algoritm[2] == 1) {
      _playerScore++;
      reset();
    } else if (_algoritm[3] == 1 && _algoritm[4] == 1 && _algoritm[5] == 1) {
      _playerScore++;
      reset();
    } else if (_algoritm[6] == 1 && _algoritm[7] == 1 && _algoritm[8] == 1) {
      _playerScore++;
      reset();
    } else if (_algoritm[0] == 1 && _algoritm[3] == 1 && _algoritm[6] == 1) {
      _playerScore++;
      reset();
    } else if (_algoritm[1] == 1 && _algoritm[4] == 1 && _algoritm[7] == 1) {
      _playerScore++;
      reset();
    } else if (_algoritm[2] == 1 && _algoritm[5] == 1 && _algoritm[8] == 1) {
      _playerScore++;
      reset();
    } else if (_algoritm[0] == 1 && _algoritm[4] == 1 && _algoritm[8] == 1) {
      _playerScore++;
      reset();
    } else if (_algoritm[2] == 1 && _algoritm[4] == 1 && _algoritm[6] == 1) {
      _playerScore++;
      reset();
    }

    if (_algoritm[0] == 0 && _algoritm[1] == 0 && _algoritm[2] == 0) {
      _botScore++;
      reset();
    } else if (_algoritm[3] == 0 && _algoritm[4] == 0 && _algoritm[5] == 0) {
      _botScore++;
      reset();
    } else if (_algoritm[6] == 0 && _algoritm[7] == 0 && _algoritm[8] == 0) {
      _botScore++;
      reset();
    } else if (_algoritm[0] == 0 && _algoritm[3] == 0 && _algoritm[6] == 0) {
      _botScore++;
      reset();
    } else if (_algoritm[1] == 0 && _algoritm[4] == 0 && _algoritm[7] == 0) {
      _botScore++;
      reset();
    } else if (_algoritm[2] == 0 && _algoritm[5] == 0 && _algoritm[8] == 0) {
      _botScore++;
      reset();
    } else if (_algoritm[0] == 0 && _algoritm[4] == 0 && _algoritm[8] == 0) {
      _botScore++;
      reset();
    } else if (_algoritm[2] == 0 && _algoritm[4] == 0 && _algoritm[6] == 0) {
      _botScore++;
      reset();
    }

    if (_algoritm[0] != 5 &&
        _algoritm[1] != 5 &&
        _algoritm[2] != 5 &&
        _algoritm[3] != 5 &&
        _algoritm[4] != 5 &&
        _algoritm[5] != 5 &&
        _algoritm[6] != 5 &&
        _algoritm[7] != 5 &&
        _algoritm[8] != 5) {
      reset();
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
                  reset();
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

  void reset() {
    _zero = Icon(null, size: MediaQuery.of(context).size.width * 0.25);
    _one = Icon(null, size: MediaQuery.of(context).size.width * 0.25);
    _two = Icon(null, size: MediaQuery.of(context).size.width * 0.25);
    _three = Icon(null, size: MediaQuery.of(context).size.width * 0.25);
    _four = Icon(null, size: MediaQuery.of(context).size.width * 0.25);
    _five = Icon(null, size: MediaQuery.of(context).size.width * 0.25);
    _six = Icon(null, size: MediaQuery.of(context).size.width * 0.25);
    _seven = Icon(null, size: MediaQuery.of(context).size.width * 0.25);
    _eight = Icon(null, size: MediaQuery.of(context).size.width * 0.25);
    _i = 0;
    _algoritm = [5, 5, 5, 5, 5, 5, 5, 5, 5];
  }
}
