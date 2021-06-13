import 'package:flutter/material.dart';
// http package
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class AddPage extends StatefulWidget {
  //const AddPage({ Key? key }) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  var ctl_taskname = TextEditingController();
  var ctl_taskdetail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Text(
            "รายการ",
            style: TextStyle(fontSize: 40.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
          child: TextField(
            controller: ctl_taskname,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ),
        Center(
          child: Text(
            "รายละเอียด",
            style: TextStyle(fontSize: 40.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
          child: TextField(
            controller: ctl_taskdetail,
            decoration: InputDecoration(border: OutlineInputBorder()),
            keyboardType: TextInputType.multiline,
            maxLines: 5,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
          child: ElevatedButton(
            child: Text("Save"),
            onPressed: () {
              print("Save Button");
              _PostTask();
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                padding: MaterialStateProperty.all(EdgeInsets.all(40)),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))),
          ),
        ),
      ],
    );
  }

  Future<String> _PostTask() async {
    // https://7382a19a9717.ngrok.io/api-post
    var url = Uri.https('7382a19a9717.ngrok.io', '/api-post');
    Map<String, String> headers = {"Content-type": "application/json"};
    var v1 = ctl_taskname.text;
    var v2 = ctl_taskdetail.text;
    String jsondata = '{"task_name":"$v1", "task_detail":"$v2"}';
    var response = await http.post(url, headers: headers, body: jsondata);

    int statusCode = response.statusCode;
    String body = response.body;
    print(statusCode);
    print(body);
    print('-----');
    setState(() {
      ctl_taskname.clear();
      ctl_taskdetail.clear();
    });
  }
}
