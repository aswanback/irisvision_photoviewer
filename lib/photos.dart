import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:irisvision/json.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoScreen extends StatefulWidget {
  final int albumId;
  PhotoScreen({this.albumId});
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
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.grey[100],
        elevation: 10,
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
            return Container(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
                  itemCount: thumbs.length,
                  itemBuilder: (context, index) {
                      return InkResponse(
                          child: Image.network(thumbs[index]),
                        onTap: () => openBottomSheet(context,urls,titles,index),
                          //Navigator.push(context,MaterialPageRoute(builder:(context) => GoToGallery(urls: urls, titles: titles, index: index)));

                      );
                    },
                ));
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          return Center(child: CupertinoActivityIndicator());
        },
      ),
    );
  }
}

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
        color: Theme.of(context).canvasColor,
        child: PhotoViewGestureDetectorScope(
          axis: Axis.vertical,
          child: PhotoViewGallery.builder(
            pageController: pageController,
            scrollPhysics: const BouncingScrollPhysics(),
            backgroundDecoration: BoxDecoration(color: Theme.of(context).canvasColor,),
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

class GoToGallery extends StatelessWidget {
  final List urls;
  final List titles;
  final int index;
  final PageController pageController;

  @override
  void dispose() {
    pageController.dispose();
  }

  GoToGallery({this.urls, this.titles,this.index}) : pageController = PageController(initialPage: index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
        ),
        child: PhotoViewGallery.builder(
          pageController: pageController,
          scrollPhysics: const BouncingScrollPhysics(),
          backgroundDecoration: BoxDecoration(color: Theme.of(context).canvasColor,),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(urls[index]),
              initialScale: PhotoViewComputedScale.contained * 0.8,
              heroAttributes: PhotoViewHeroAttributes(tag: titles[index]),
            );
          },
          itemCount: urls.length,
          loadingBuilder: (context, event) => Center(
            child: Container(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded / event.expectedTotalBytes,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
