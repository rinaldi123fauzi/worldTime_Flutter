import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Jakarta', flag: 'indonesia.png', url: 'Asia/Jakarta');
    await instance.getTime();
    print(instance.time);
    setState(() {
      time = instance.time.toString();
    });
  }

  @override
  void initState() {//constructor
    // TODO: implement initState
    super.initState();
    setupWorldTime();
    print('hey there!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text(time.toString()),
      ),
    );
  }
}
