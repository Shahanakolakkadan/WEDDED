import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:wedded_flutter/layout/login.dart';
import 'package:wedded_flutter/layout/vendor_register.dart';

class profilevendor extends StatefulWidget {
  const profilevendor({Key? key}) : super(key: key);

  @override
  State<profilevendor> createState() => _profilevendorState();
}

class _profilevendorState extends State<profilevendor> {
  @override
  late List data;
  void view() async {
    Response resp=await post(login.url+"vendor_register/pro1/", body: {
    "uid":login.uid
  });
    setState(() {
      data = jsonDecode(resp.body);
    });
  }
  @override
  void initState() {
    view();
  }
  Widget build(BuildContext context) {
    view();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 36, 16),
        title: Text("PROFILE"),
        actions: [
          IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => vendor_register()));
          },
          icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body : Container(
        child: new ListView.builder(
          itemCount: data!=null?data.length:0,
          itemBuilder: (BuildContext context, int index){
            return new Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 30), 
              child: new Card(child: Column(mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget> [
                new SizedBox(
                  height: 20,
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('NAME:     ' +data[index]['vendor_name'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('PHONE NO: ' +data[index]['phone_no'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('EMAIL:     ' +data[index]['email'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('CITY:      ' +data[index]['city'].toString()),
                  ],
                ),
                
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('DISTRICT: ' +data[index]['district'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('STATE:   ' +data[index]['state'].toString()),
                  ],
                ),
              ],
              ),),
            );
          }),
      ),

      );
  }
}