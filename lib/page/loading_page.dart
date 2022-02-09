import 'package:bignner_cours/page/services/world_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}
class _LoadingPageState extends State<LoadingPage> {
  get isDayTime => null;
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
      location: 'Herat',
      flag: 'afg.png',
      url: 'asia/kabul',
      time: '10',
    );
    await instance.getTime();
    try {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDayTime': instance.isDayTime,
      });
    } catch (e) {
      print('caught error: $e');
    }
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
