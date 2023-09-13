import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:pie_chart/pie_chart.dart';
import 'package:wedded_flutter/layout/login.dart';

class bookstatusview extends StatefulWidget {
  const bookstatusview({Key? key}) : super(key: key);
  @override
  State<bookstatusview> createState() => _bookstatusviewState();
}

class _bookstatusviewState extends State<bookstatusview> {
  @override
  late List data,data1;
  var a;
  // var a,b;
  // final dataMap;
  // final dataMap = <String, double>{
  //   "Flutter": 5,
  //   "burger":10,
  //   // "puffs":3,
  //   // "opp":4
  // };

  final colorList = <Color>[
    // Colors.greenAccent,
    Colors.green,
    // Colors.amber,
    Colors.blue
  ];
  void postdat() async {
    var url = Uri.parse(login.url+"booking/use/");
    Response resp1=await post(url,body: {
      "uid":login.uid
    });
    this.setState(() {
      data1 = jsonDecode(resp1.body);
      a=resp1.body.toString();
      // var chrt=resp1.body.split("#");
      // a=chrt[0].toString();
      // b=chrt[1].toString();
      // dataMap.clear();
      // dataMap["Approved"]=a;
      // dataMap["Rejected"]=b;

    });

  }
  void view() async {
    var url = Uri.parse(login.url+"booking/status/");
    Response resp=await post(url,
      body: {
      "uid":login.uid
      }
    );
    setState(() {
      data = jsonDecode(resp.body);
    });
  }
  

  @override
  void initState() {
    view();
    postdat();
    
  }
  // final dataMap=

  Widget build(BuildContext context) {
    view();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 36, 16),
        title: Text("WEDDED"),
      ),
    body :
    SingleChildScrollView(
      child: Column(
        children: [
          Image.network(login.url+"static/"+"graph1.png"),
          Container(
              child: new ListView.builder(
                shrinkWrap: true,
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
                          Text('Name: ' +data[index]['name'].toString()),
                        ],
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Wedding date: ' +data[index]['function_date'].toString()),
                        ],
                      ),
                      // new Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Text('' +data[index]['city'].toString()),
                      //   ],
                      // ),
                      // new Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Text('' +data[index]['district'].toString()),
                      //   ],
                      // ),
                      // new Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Text('' +data[index]['state'].toString()),
                      //   ],
                      // ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Phone number: ' +data[index]['phone'].toString()),
                        ],
                      ),
                      // new Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Text('' +data[index]['city'].toString()),
                      //   ],
                      // ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Email id: ' +data[index]['email'].toString()),
                        ],
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Details of wedding: ' +data[index]['details'].toString()),
                        ],
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Date of booking: ' +data[index]['booking_date'].toString()),
                        ],
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Time of booking: ' +data[index]['booking_time'].toString()),
                        ],
                      ),
                       new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Status: ' +data[index]['status'].toString()),
                        ],
                      ),
                //       Container(child: ElevatedButton(
                //   onPressed: () {
                //     // bookstatusview.srid=data[index]['service_id'].toString();
                //     // Navigator.of(context).push(MaterialPageRoute(
                //     //   builder: (BuildContext context) => view_vendor1()));
                //   },
                //     style: ElevatedButton.styleFrom(
                //       primary: Color.fromARGB(255, 78, 36, 16),
                //       minimumSize: Size(200, 50),
                //     ),
                //     child: Text('View Details')
                // )
                // ),

                    ],
                    ),),
                  );
                }),
            ),
        ],
      ),
    ),
    );
  }
}
