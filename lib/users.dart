import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:irisvision/json.dart';
import 'package:irisvision/albums.dart';
import 'package:irisvision/home.dart';
import 'package:irisvision/splash.dart';
import 'package:page_transition/page_transition.dart';

class users extends StatefulWidget {
  @override
  _usersState createState() => _usersState();
}

class _usersState extends State<users> {
  Future<List> future_users_list;

  @override
  void initState() {
    super.initState();
    future_users_list = getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("IrisPhoto"),
        brightness: Brightness.light,
        backgroundColor: Colors.grey[100],
        elevation: 10,
      ),
      body: FutureBuilder<List>(
        future: future_users_list,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AlbumScreen(userId: snapshot.data[index].id),),),
                            child:Text(snapshot.data[index].name)),
                        Expanded(child: SizedBox(width: 20,)),
                        TextButton(
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => InfoScreen(
                            id: snapshot.data[index].id,
                            name:snapshot.data[index].name,
                            username: snapshot.data[index].username,
                            email: snapshot.data[index].email,
                            phone: snapshot.data[index].phone,
                            address:snapshot.data[index].address,

                          ),),),
                          child: Text("Info"),)
                      ],
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Column(children: [
              Text("${snapshot.error}"),
            ]);
          }
          return Center(child:CupertinoActivityIndicator());
        },
      ),
    );
  }
}

class InfoScreen extends StatefulWidget {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String address;

  InfoScreen({this.id, this.name, this.username,this.email,this.phone,this.address});

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
        brightness: Brightness.light,
        backgroundColor: Colors.grey[100],
        elevation: 10,
      ),
        body:Container(
            child:Center(
              child:Column(
                children: [
                  Text("Name: ${widget.name}"),
                  Text("Username: ${widget.username}"),
                  Text("Email: ${widget.email}"),
                  Text("Phone: ${widget.phone}"),
                  Text("Address: ${widget.address}"),
                ],
              )
            )
        ));
  }
}
