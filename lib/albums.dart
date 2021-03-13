import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:irisvision/json.dart';
import 'package:page_transition/page_transition.dart';
import 'package:irisvision/photos.dart';

class albums extends StatefulWidget {
  @override
  _albumsState createState() => _albumsState();
}

class _albumsState extends State<albums> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("hi")));
  }
}

//Gets a user's albums, returned as a column widget of button leading to the photos in the album
class AlbumScreen extends StatefulWidget {
  final int userId;
  AlbumScreen({this.userId});
  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  Future<List> future_album_list;

  @override
  void initState() {
    super.initState();
    future_album_list = getAlbums();
  }

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
          appBar: AppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.grey[100],
            elevation: 10,
          ),
          body: FutureBuilder<List>(
            future: future_album_list,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List titles = [];
                List ids = [];
                for (int i = 0; i < snapshot.data.length; i++) {
                  if (snapshot.data[i].userId == widget.userId)
                    titles.add(snapshot.data[i].title);
                  ids.add(snapshot.data[i].id);
                }
                return Container(
                  child: ListView.builder(
                    itemCount: titles.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(titles[index]),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PhotoScreen(albumId: ids[index]),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Column(children: [
                  Text("${snapshot.error}"),
                ]);
              }
              return Center(child: CupertinoActivityIndicator());
            },
          ),
        ),
      ],
    );
  }
}
