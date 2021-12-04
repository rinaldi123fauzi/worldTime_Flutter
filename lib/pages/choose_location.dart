import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  List<WorldTime> locations = [
    WorldTime(location: 'London', flag: 'london_flag.jpeg', url: 'Europe/London'),
    WorldTime(location: 'Berlin', flag: 'germany_flag.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Jakarta', flag: 'indonesia_flag.jpg', url: 'Asia/Jakarta'),
  ];

  // void getData() async {
  //   //simulate network request for a username
  //   // await Future.delayed(Duration(seconds: 3), () {
  //   //   print('rinaldi');
  //   // });
  //
  //   //simulate network request for a username
  //   String username = await Future.delayed(Duration(seconds: 3), () {
  //     return 'rinaldi';
  //   });
  //
  //   //simulate network request to get bio for the username
  //   String bio = await Future.delayed(Duration(seconds: 2), () {
  //     return 'fauzi, engineer & alone';
  //   });
  //
  //   print('$username - $bio');
  // }

  @override
  void initState() {//constructor
    // TODO: implement initState
    super.initState();
    // getData();
    print('hey there!');
  }

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigation to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
    Navigator.of(context).pushNamedAndRemoveUntil('/location', (Route<dynamic> route) => false);//used error handler for navigator pop (debuglocked)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: RaisedButton(
        onPressed: () {
          setState(() {
            counter += 1;
          });
        },
        // child: Text('counter is $counter'),
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 0.5),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
