import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = "loading";
  void setupWorldTime () async{
    WorldTime instense = WorldTime(location:"Berlin", flag:'germany.png', urlEndPoint:'Europe/Berlin');
    await instense.getTime();
    Navigator.pushReplacementNamed(context, '/home',
    arguments: {
      'location': instense.location,
      'falg': instense.flag,
      'time': instense.time,
      'isDayTime' : instense.isDayTime,
    }
    );

  }

  @override
  void initState() {
    // TODO: implement initState
    // print("init");
    setupWorldTime();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    // print("Build");
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child:SpinKitRotatingCircle(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }


}


