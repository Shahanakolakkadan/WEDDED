import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wedded_flutter/layout/login.dart';
import 'package:http/http.dart';
import 'package:wedded_flutter/layout/view_vendor_1.dart';

class outp extends StatefulWidget {
  const outp({Key? key}) : super(key: key);

  @override
  State<outp> createState() => _outpState();
  static var rs="";
}

class _outpState extends State<outp> {
  late List data;

  void view() async {
    var url = Uri.parse(login.url+"service/out/");
    // print(outp.rs);
    Response resp=await post(url,
        body: {
          "res":outp.rs.toString()
        }
    );
    setState(() {
      data = jsonDecode(resp.body);
    });
  }
  @override
  Widget build(BuildContext context) {
    view();
    return Scaffold(
      appBar: AppBar(title: Text("WEDDED"),),
      body: Container(
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
                        Text('Name: ' +data[index]['business_name'].toString()),
                      ],
                    ),
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
                    // new Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Text('Phone number: ' +data[index]['phone'].toString()),
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
                    //     Text('Email id: ' +data[index]['email'].toString()),
                    //   ],
                    // ),
                    // new Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Text('Details of wedding: ' +data[index]['details'].toString()),
                    //   ],
                    // ),
                    // new Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Text('Date of booking: ' +data[index]['booking_date'].toString()),
                    //   ],
                    // ),
                    // new Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Text('Time of booking: ' +data[index]['booking_time'].toString()),
                    //   ],
                    // ),
                    // new Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Text('Status: ' +data[index]['status'].toString()),
                    //   ],
                    // ),
                          Container(child: ElevatedButton(
                      onPressed: () {
                        view_vendor1.srid=data[index]['service_id'].toString();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => view_vendor1()));
                        // bookstatusview.srid=data[index]['service_id'].toString();
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (BuildContext context) => view_vendor1()));
                      },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 78, 36, 16),
                          minimumSize: Size(200, 50),
                        ),
                        child: Text('View Details')
                    )
                    ),

                  ],
                ),),
              );
            }),
      ),

    );
  }
}
