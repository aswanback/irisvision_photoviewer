import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:irisvision/json.dart';
import 'package:irisvision/PhotoScreen.dart';


class AlbumScreen extends StatefulWidget {
  final int userId;
  final String name;
  AlbumScreen({this.userId,this.name});
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
            brightness: Brightness.dark,
            backgroundColor: Colors.grey[900],
            elevation: 10,
            title: Text("${widget.name}'s Albums",style: TextStyle(color:Colors.deepPurple[400]),),
            iconTheme: IconThemeData(color: Colors.white54),
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2, 18, 2, 2),
                    child: ListView.builder(
                      itemCount: titles.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Opacity(
                            opacity: 0.85,
                            child: Container(
                              color: Colors.black87,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                                child: Text(titles[index],style: TextStyle(color: Colors.grey[100]),),
                              ),
                            ),
                          ),
                          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => PhotoScreen(albumId: ids[index],title:titles[index]),),
                            );
                          },
                        );
                      },
                    ),
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
