import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryList extends StatefulWidget {
  const CountryList({Key? key}) : super(key: key);

  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  Future<List<User>> _getUser() async{
    var data = await http.get(Uri.parse("https://countriesnow.space/api/v0.1/countries/flag/images"));
    var jsonData = jsonDecode(data.body);
    List<User> users = [];
    for(var u in jsonData["data"]){
      User user = User(u["name"], u["flag"]);
      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Dummy'),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getUser(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.data == null){
              return Container(
                child: Center(
                  child: Text("Loading..."),
                ),
              );
            }else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          snapshot.data[index].flag
                        ),
                      ),
                      title: Text(snapshot.data[index].name),
                    );
                  }
              );
            }
          },
        ),
      ),
    );
  }
}

class User{
  final String name;
  final String flag;

  User(this.name, this.flag);
}
