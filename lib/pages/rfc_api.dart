import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RfcApi extends StatefulWidget {
  const RfcApi({Key? key}) : super(key: key);

  @override
  _RfcApiState createState() => _RfcApiState();
}

class _RfcApiState extends State<RfcApi> {
  Future<List<User>> _getUser() async{
    var data = await http.get("https://rfc.pgn-solution.co.id/api/v1/api_tests",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo3LCJleHAiOjE2MzkwMzU1Mjl9.1V9CBp3FKtUbZOL-FNoNYcA40y9ckebAaH-2cww0gN4',
        }
    );
    var jsonData = jsonDecode(data.body);
    List<User> users = [];
    for(var u in jsonData["body"]){
      User user = User(u["nama"]);
      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Data RFC'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: FutureBuilder(
          future: _getUser(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
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
                      title: Text(snapshot.data[index].nama),
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
  final String nama;

  User(this.nama);
}
