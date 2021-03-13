import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  void delayTime() async {
    await Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }
  @override
  void initState() {
    super.initState();
    delayTime();
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
                CupertinoActivityIndicator(animating: true,),
              ],
            ),),


        ),
      ],
    );
  }
}