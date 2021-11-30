import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  void getData() async {
    //simulate network request for a username
    // await Future.delayed(Duration(seconds: 3), () {
    //   print('rinaldi');
    // });

    //simulate network request for a username
    String username = await Future.delayed(Duration(seconds: 3), () {
      return 'rinaldi';
    });

    //simulate network request to get bio for the username
    String bio = await Future.delayed(Duration(seconds: 2), () {
      return 'fauzi, engineer & alone';
    });

    print('$username - $bio');
  }

  @override
  void initState() {//constructor
    // TODO: implement initState
    super.initState();
    getData();
    print('hey there!');
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
        child: Text('counter is $counter'),
      ),
    );
  }
}
