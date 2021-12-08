import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    //set background
    String bgImage = data['isDaytime'] ? 'days.jpeg' : 'night.jpeg';
    var fontColor = data['isDaytime'] ? Colors.black38 : Colors.white60;
    var bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () async{
                       dynamic result = await Navigator.pushNamed(context, '/location');
                       setState(() {
                         data = {
                           'time': result['time'],
                           'location': result['location'],
                           'isDaytime': result['isDaytime'],
                           'flag': result['flag'],
                         };
                       });
                      },
                      icon: Icon(Icons.edit_location,color: fontColor),
                      label: Text(
                          'Edit Location',
                          style: TextStyle(
                            color: fontColor,
                          ),
                      )
                  ),
                  if (data['time'] == 'could not get time data, please refresh again') FlatButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      icon: Icon(Icons.water_damage,color: fontColor),
                      label: Text(
                          'Refresh',
                          style: TextStyle(
                            color: fontColor,
                          ),
                      )
                  ),
                  FlatButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/country');
                      },
                      icon: Icon(Icons.water_damage,color: fontColor),
                      label: Text(
                        'Country List',
                        style: TextStyle(
                          color: fontColor,
                        ),
                      )
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: fontColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                        fontSize: 50.0,
                        color: fontColor,
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
