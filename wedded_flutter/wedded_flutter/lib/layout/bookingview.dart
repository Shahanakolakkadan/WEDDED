import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:pie_chart/pie_chart.dart';
import 'package:wedded_flutter/layout/login.dart';

class bookingview extends StatefulWidget {
  const bookingview({Key? key}) : super(key: key);
  @override
  State<bookingview> createState() => _bookingviewState();
}

class _bookingviewState extends State<bookingview> {
  @override
  late List data,data1;
  var a,b;
  void postdat() async {
    var url = Uri.parse(login.url+"booking/chart/");
    Response resp1=await get(url);
    setState(() {
      data1 = jsonDecode(resp1.body);
      var chrt=resp1.body.split("#");
      a=chrt[0].toString();
      b=chrt[1].toString();
      dataMap.clear();
      dataMap["completed"]=a;
      dataMap["pending"]=b;

    });

  }
  final dataMap = <String, double>{
    "Flutter": 5,
    "burger":10,
    // "puffs":3,
    // "opp":4
  };

  final colorList = <Color>[
    // Colors.greenAccent,
    Colors.green,
    // Colors.amber,
    Colors.blue
  ];
  void view() async {
    var url = Uri.parse(login.url+"booking/Bookingview/");
    Response resp=await post(url,body: {
      "uid":login.uid
    }
    );
    setState(() {
      data = jsonDecode(resp.body);
    });
  }
  
 void accept(bid) async {
    var url = Uri.parse(login.url+"booking/Acceptbook/");
    Response resp=await post(url,body: {
      "bid":bid
    });
 }

void reject(bid) async {
    var url = Uri.parse(login.url+"booking/Rejectbook/");
    Response resp=await post(url,body: {
      "bid":bid
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
        title: Text("WEDDED"),
      ),
    body : Column( 
      children: [
        // Container(
        //   color: Colors.black,
        //   padding: EdgeInsets.symmetric(horizontal: 16),
        //   child: PieChart(
        //     dataMap: dataMap,
        //     chartType: ChartType.ring,
        //     baseChartColor: Colors.grey[50]!.withOpacity(0.15),
        //     colorList: colorList,
        //     chartValuesOptions: ChartValuesOptions(
        //       showChartValuesInPercentage: true,
        //     ),
        //     totalValue: 20,
        //   ),
        // ),
        Image.network(login.url+"static/"+"graph.png"),
        Container(
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
                    // new Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Text('Name: ' +data[index]['name'].toString()),
                    //   ],
                    // ),
                    // new Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Text('Wedding date: ' +data[index]['function_date'].toString()),
                    //   ],
                    // ),
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
                    // new Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Text('Details of wedding: ' +data[index]['details'].toString()),
                    //   ],
                    // ),
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
              //     // bookingview.srid=data[index]['service_id'].toString();
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
              Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
        ElevatedButton(
          onPressed: () {
            accept(data[index]['booking_id'].toString());
          },
          style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 78, 36, 16),
                    minimumSize: Size(200, 50),
                  ),
          child: Text('ACCEPT'),
        ),
        ElevatedButton(
          onPressed: () {
            reject(data[index]['booking_id'].toString());
          },
          style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 78, 36, 16),
                    minimumSize: Size(200, 50),
                  ),
          child: Text('REJECT'),
        ),
  ],
)
                  ],
                  ),),
                );
              }),
          ),
      ],
    ),
    );
  }
}
