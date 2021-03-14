import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:irisvision/json.dart';
import 'package:irisvision/AlbumScreen.dart';



class InfoScreen extends StatefulWidget {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String address;

  InfoScreen(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.phone,
        this.address});

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User Info"),
          brightness: Brightness.dark,
          backgroundColor: Colors.grey[900],
          elevation: 10,
        ),
        body: Container(
          color: Colors.black87,
            child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        Text("Name",style: TextStyle(color: Colors.white54,fontSize: 20),),
                        Expanded(child: SizedBox(width: 10,)),
                        Text("${widget.name}",style: TextStyle(color: Colors.white54,fontSize: 20),)
                      ],),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        Text("Username",style: TextStyle(color: Colors.white54,fontSize: 20),),
                        Expanded(child: SizedBox(width: 10,)),
                        Text("${widget.username}",style: TextStyle(color: Colors.white54,fontSize: 20),)
                      ],),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        Text("Email",style: TextStyle(color: Colors.white54,fontSize: 20),),
                        Expanded(child: SizedBox(width: 10,)),
                        Text("${widget.email}",style: TextStyle(color: Colors.white54,fontSize: 20),)
                      ],),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        Text("Phone",style: TextStyle(color: Colors.white54,fontSize: 20),),
                        Expanded(child: SizedBox(width: 10,)),
                        Text("${widget.phone}",style: TextStyle(color: Colors.white54,fontSize: 20),)
                      ],),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("Address",style: TextStyle(color: Colors.white54,fontSize: 20),),
                        Expanded(child: SizedBox(width: 10,)),
                        Expanded(child: Text("${widget.address}",style: TextStyle(color: Colors.white54,fontSize: 20,)))
                      ],),
                    ),
                  ],
                ))));
  }
}
