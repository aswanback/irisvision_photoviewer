import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'json.dart';
import 'UserScreen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  List future_users_list;

  @override
  void initState()  {
    super.initState();
    getJsonUsers();
  }

  void getJsonUsers() async {
    future_users_list = await getUsers();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserScreen(user_data: future_users_list)));
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
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image:AssetImage('assets/logo.png'),),
                SizedBox(height: 40,),
                Theme(data: ThemeData(cupertinoOverrideTheme: CupertinoThemeData(brightness: Brightness.dark)),
                    child: CupertinoActivityIndicator())
              ],
            ),
          ),
        ),
      ],
    );
  }
}