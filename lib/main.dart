import 'package:api_clock/page/choose_location.dart';
import 'package:api_clock/page/home_page.dart';
import 'package:api_clock/page/loading_page.dart';
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
