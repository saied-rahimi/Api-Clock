import 'package:bignner_cours/page/choose_location.dart';
import 'package:bignner_cours/page/home_page.dart';
import 'package:bignner_cours/page/loading_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingPage(),
        '/home': (context) => HomePage(),
        '/location': (context) => ChooseLocationPage(),
      },
    ));
