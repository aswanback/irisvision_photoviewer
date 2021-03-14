import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:irisvision/json.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoScreen extends StatefulWidget {
  final int albumId;
  final String title;
  PhotoScreen({this.albumId,this.title});
  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  Future<List> future_photo_list;

  @override
  void initState() {
    super.initState();
    future_photo_list = getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.grey[900],
        elevation: 10,
        iconTheme: IconThemeData(color: Colors.white54),
        title: Text("${widget.title}",style: TextStyle(color:Colors.deepPurple[400]),),
      ),
      body: FutureBuilder<List>(
        future: future_photo_list,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List urls = [];
            List titles = [];
            List thumbs = [];
            for (int i = 0; i < snapshot.data.length; i++) {
              if (snapshot.data[i].albumId == widget.albumId) {
                thumbs.add(snapshot.data[i].thumbnailUrl);
                urls.add(snapshot.data[i].url);
                titles.add(snapshot.data[i].title);
              }
            }
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                color: Colors.grey[900],
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 5.0, mainAxisSpacing: 5.0),
                    itemCount: thumbs.length,
                    itemBuilder: (context, index) {
                        return InkResponse(
                            child: Image.network(thumbs[index]),
                          onTap: () => openBottomSheet(context,urls,titles,index),

                        );
                      },
                  )),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          return Center(child: CupertinoActivityIndicator());
        },
      ),
    );
  }
}

//Opens the PhotoViewGallery
void openBottomSheet(BuildContext context,List urls,List titles, int index) {
  PageController pageController = PageController(initialPage: index);
  showBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    shape: const ContinuousRectangleBorder(),
    builder: (BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey[900],//Theme.of(context).canvasColor,
        child: PhotoViewGestureDetectorScope(
          axis: Axis.vertical,
          child: PhotoViewGallery.builder(
            pageController: pageController,
            scrollPhysics: const BouncingScrollPhysics(),
            backgroundDecoration: BoxDecoration(color: Colors.grey[900],),//Theme.of(context).canvasColor,),
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(urls[index]),
                initialScale: PhotoViewComputedScale.contained * 0.8,
                heroAttributes: PhotoViewHeroAttributes(tag: titles[index]),
              );
            },
            itemCount: urls.length,
            loadingBuilder: (context, event) =>
                Center(
                  child: Container(
                    width: 20,
                    height:  20,
                    child: CupertinoActivityIndicator(
                      animating: true,
                    ),
                  ),
                ),
          ),
        ),
      );
    },
  );
}