import 'package:flutter/material.dart';
import 'package:taskapp/pages/taskcard.dart';
// http package
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class FirstPage extends StatefulWidget {
  //const FirstPage({ Key? key }) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FutureBuilder(
          future: _GetTask(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('${snapshot.data[index].task_name}'),
                      subtitle: Text('${snapshot.data[index].task_detail}'),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
      ],
    );
  }

  Future<List<TaskCard>> _GetTask() async {
    var url = Uri.https('7382a19a9717.ngrok.io', '/api-task');
    var response = await http.get(url);

    var decodeData = utf8.decode(response.bodyBytes);
    var data = jsonDecode(decodeData);

    print(data);
    List<TaskCard> _list = [];

    for (var i in data) {
      TaskCard t =
          TaskCard(task_name: i['task_name'], task_detail: i['task_detail']);
      _list.add(t);
    }

    return _list;
  }
}
