import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:irisvision/AlbumScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'InfoScreen.dart';


class UserScreen extends StatelessWidget {
  final List user_data;

  UserScreen({this.user_data});

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
            title: Center(
              child: Text(
                "irisPhoto",
                style: TextStyle(color: Colors.deepPurple[400]),
              ),
            ),
            brightness: Brightness.dark,
            backgroundColor: Colors.grey[900],
            elevation: 10,
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(0, 18, 0, 2),
            child: Container(
              child: ListView.builder(
                itemCount: user_data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Opacity(
                      opacity: 0.85,
                      child: Container(
                        color: Colors.black87,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                user_data[index].name,
                                style: TextStyle(color: Colors.grey[100]),
                              ),
                              Expanded(
                                  child: SizedBox(
                                    width: 20,
                                  )),


                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.leftToRightWithFade,
                                          child: InfoScreen(
                                            id: user_data[index].id,
                                            name: user_data[index].name,
                                            username:
                                            user_data[index].username,
                                            email: user_data[index].email,
                                            phone: user_data[index].phone,
                                            address:
                                            user_data[index].address,
                                          ),));
                                },
                                child: Text("Info",style: TextStyle(color: Colors.orange[600]),),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.rightToLeftWithFade,
                                          child: AlbumScreen(
                                            userId:
                                            user_data[index].id,
                                            name:
                                            user_data[index].name,
                                          ),));
                                  },


                                  child: Text('Albums',style: TextStyle(color: Colors.orange[600]),)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )




          /*FutureBuilder<List>(
            future: future_users_list,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return
              } else if (snapshot.hasError) {
                return Column(children: [
                  Text("${snapshot.error}"),
                ]);
              }
              return Center(child: CupertinoActivityIndicator());
            },
          ),*/
        ),
      ],
    );
  }
}

