import 'package:flutter/material.dart';
import './screens/home_page.dart';
import './screens/don_don_ziki.dart';
import './screens/tic_tac_toe.dart';
import './screens/racing.dart';
import './screens/tapping.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        'Tic Tac Toe': (context) => const ToeGame(),
        'Don Don Ziki': (context) => const ZikiGame(),
        'Racing': (context) => const RacingGame(),
        "Tapping Game": (context) => const TappingGame(),
      },
      initialRoute: '/',
    );
  }
}
