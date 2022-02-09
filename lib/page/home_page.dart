import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    String bgImage = data['isDayTime'] ? 'day_sky.jpg' : 'night_sky.jpg';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(
                      () {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'flag': result['flag'],
                          'isDayTime': result['isDayTime'],
                        };
                      },
                    );
                  },
                  icon: Icon(
                    Icons.location_on_rounded,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 66,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
