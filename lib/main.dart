import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:irisvision/json.dart';
import 'package:irisvision/albums.dart';
import 'package:irisvision/home.dart';
import 'package:irisvision/splash.dart';
import 'package:page_transition/page_transition.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  App({Key key}) : super(key: key);
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => splash(), //loading - splash
          '/home': (context) => home(),
       //   '/pinned': (context) => pinned(),
       //   '/': (context) => add_photo(),
          '/albums': (context) => albums(),
        //  '/photos': (context) => photos(),

          //'/communities': (context) => Communities(),   add later
        });
  }
}
