import 'package:flutter/material.dart';
import 'package:world_time/services/rest_api.dart';
import 'package:world_time/services/models.dart';

class CountryFlag extends StatefulWidget {
  const CountryFlag({Key? key}) : super(key: key);

  @override
  _CountryFlagState createState() => _CountryFlagState();
}

class _CountryFlagState extends State<CountryFlag> {

  List<User> _users = [];
  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    List<User> users =
    await RestApi.getUsers(); // load the users on Widget init
    setState(() => _users = users);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Country Flag'),
        centerTitle: true,
        elevation: 0,
      ),
      body: new ListView.builder(
        itemCount: _users.length,
        itemBuilder: (BuildContext ctxt, int i) {
          return new Card(
            child: Column(
              children: [
                Text(_users[i].name),
                ListView.builder(
                  itemCount: _users[i].data.length,
                  itemBuilder: (BuildContext ctx, int j) {
                    return Text(_users[i]
                        .data[j]
                        .name); // display username as an example
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
