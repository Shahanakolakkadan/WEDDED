import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:wedded_flutter/layout/login.dart';




class vprework extends StatefulWidget {
  const vprework({Key? key}) : super(key: key);
  static var vid="";
  // static var chittyid;

  @override
  State<vprework> createState() => _vpreworkState();
}

class _vpreworkState extends State<vprework> {
  late List data;
  void List_function() async {
    var url = Uri.parse(login.url+"product/prflutt/");
    Response resp1 = await post(url,body: {
      "vid":vprework.vid
    });
    this.setState(() {
      data = jsonDecode(resp1.body);
    });
    print(resp1.body);
  }

  // void postdata() async{
  //   var url = Uri.parse(login.url+"chitty_request/chitreqflut/");
  //   Response resp1 = await post(url,body: { "chitty_id": chittyid.toString() });
  // }
  @override
  Widget build(BuildContext context) {
    List_function();
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.pinkAccent.shade200,
        title: Text(
          "VIEW PREVIOUS WORK",
          style: new TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/sam8.jpeg'),
                fit: BoxFit.cover,
              )
          ),
          child: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            // itemCount: 2,
            itemBuilder: (context, index) {
              return new Padding(
                padding: new EdgeInsets.fromLTRB(20, 05, 10, 5),
                child: new Card(
                  elevation: 2.0,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(16.0)
                  ),
                  child: InkWell(
                    onTap: () {
                      print("tapped");
                      //  tap funtion here

                    },
                    child: new Column(
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.all(16.0),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.network(login.url+"static/"+data[index]['file'].toString()),
                              // new Text("PRODUCT NAME:"+" "+data[index]['name'].toString(), style: Theme
                              //     .of(context)
                              //     .textTheme
                              //     .titleMedium,
                              // ),
                              // new SizedBox(height: 6.0),
                              //
                              // new Text(('BRAND:' ).toUpperCase()+" "+data[index]['brand'].toString(), style: Theme
                              //     .of(context)
                              //     .textTheme
                              //     .titleMedium
                              // ),
                              // new SizedBox(height: 6.0),
                              //
                              // new Text(('PRICE:' ).toUpperCase()+" "+data[index]['price'].toString(), style: Theme
                              //     .of(context)
                              //     .textTheme
                              //     .titleMedium
                              // ),
                              // new SizedBox(height: 6.0),
                              //
                              // new Text(('DESCRIPPTION:' ).toUpperCase()+" "+data[index]['description'].toString(), style: Theme
                              //     .of(context)
                              //     .textTheme
                              //     .titleMedium
                              // ),
                              // new SizedBox(height: 6.0),
                              //
                              // new Text(('DATE:' ).toUpperCase()+" "+data[index]['date'].toString(), style: Theme
                              //     .of(context)
                              //     .textTheme
                              //     .titleMedium
                              // ),
                              // Container(
                              //   child: ElevatedButton(
                              //       onPressed: (){
                              //         quan.pid=data[index]['p_id'].toString();
                              //         Navigator.of(context).push(MaterialPageRoute(
                              //             builder: (BuildContext context) => quan()));
                              //         // showDialog(context: context, builder: (context) => AlertDialog(
                              //         //     content: Text("successfully requested")));
                              //         // request(data[index]['chitty_id'].toString());
                              //         // postdata();
                              //
                              //       },child: Text("Order")
                              //   ),
                              // ),
                              // Container(
                              //   child: ElevatedButton(
                              //       onPressed: (){
                              //         pro_review.pid=data[index]['p_id'].toString();
                              //         Navigator.of(context).push(MaterialPageRoute(
                              //             builder: (BuildContext context) => pro_review()));
                              //         // showDialog(context: context, builder: (context) => AlertDialog(
                              //         //     content: Text("successfully requested")));
                              //         // request(data[index]['chitty_id'].toString());
                              //         // postdata();
                              //
                              //       },child: Text("Review")
                              //   ),
                              // )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )
      ),
    );
  }
}

