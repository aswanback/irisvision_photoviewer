import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:irisvision/json.dart';
import 'package:irisvision/albums.dart';
import 'package:irisvision/users.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: AssetImage('assets/bkgd.jpg'),
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: users(),
          ),
        ),
      ],
    );
  }
}
