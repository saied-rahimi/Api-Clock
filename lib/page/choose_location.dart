
import 'package:api_clock/page/services/world_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ChooseLocationPage extends StatefulWidget {
  @override
  _ChooseLocationPageState createState() => _ChooseLocationPageState();
}
class _ChooseLocationPageState extends State<ChooseLocationPage> {
  List<WorldTime> locations = [
    WorldTime(
        url: 'Asia/Kabul', location: 'Kabul', flag: 'afg.jpg', time: 'time'),
    WorldTime(
        url: 'Europe/London', location: 'London', flag: 'uk.png', time: 'time'),
    WorldTime(
        url: 'Europe/Berlin',
        location: 'Athens',
        flag: 'greece.png',
        time: 'time'),
    WorldTime(
        url: 'Africa/Cairo',
        location: 'Cairo',
        flag: 'egypt.png',
        time: 'time'),
    WorldTime(
        url: 'Africa/Nairobi',
        location: 'Nairobi',
        flag: 'kenya.png',
        time: 'time'),
    WorldTime(
        url: 'America/Chicago',
        location: 'Chicago',
        flag: 'usa.png',
        time: 'time'),
    WorldTime(
        url: 'America/New_York',
        location: 'New York',
        flag: 'usa.png',
        time: 'time'),
    WorldTime(
        url: 'Asia/Seoul',
        location: 'Seoul',
        flag: 'south_korea.png',
        time: 'time'),
    WorldTime(
        url: 'Asia/Jakarta',
        location: 'Jakarta',
        flag: 'indonesia.png',
        time: 'time'),
  ];
  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(
      context,
      {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDayTime': instance.isDayTime,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print('build Function run');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
            child: Card(
              child: ListTile(
                onTap: () {
                  print(locations[index].location);
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('asset/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
