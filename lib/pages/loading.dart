import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time= 'loading';

  void setupWorldTime() async{
    WorldTime instance= WorldTime(location: 'Kuala Lumpur', flag: 'kualalumpur.png', url: 'Asia/Kuala_Lumpur');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });

  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body:
      Padding(
        padding: EdgeInsets.all(50.0),
        child: Center(
          child: SpinKitFadingCircle (
            color: Colors.white,
            size: 50.0,
          ),
        ),
      )
    );
  }
}
