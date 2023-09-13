import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:wedded_flutter/layout/booking.dart';
import 'package:wedded_flutter/layout/login.dart';
import 'package:wedded_flutter/layout/vendorlist.dart';
import 'package:wedded_flutter/layout/view_vendor_1.dart';

class view_vendor extends StatefulWidget {
  const view_vendor({Key? key}) : super(key: key);
  static var ftype="";
  @override
  State<view_vendor> createState() => _view_vendorState();
}

class _view_vendorState extends State<view_vendor> {
  @override
  late List data;
  late TextEditingController filt;
  late List outputList;
  void view() async {
    var url = Uri.parse(login.url+"service/Serviceview/");
    Response resp=await post(url,body: {
      'ftype': view_vendor.ftype
    });
    setState(() {
      data = jsonDecode(resp.body);
      outputList=data;
    });
  }
  // void view1() async {
  //  var url = Uri.parse("http://192.168.137.120:8000/previous_work/Previous_work/");
  //   Response resp=await post(url,body: {
  //     'ftype': view_vendor.ftype
  //   });
  //   setState(() {
  //     data1 = jsonDecode(resp.body);
  //   });
  // }
  @override
  void initState() {
    view();
    filt=TextEditingController();
    // view1();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 36, 16),
        title: Text("WEDDED"),
      ),
      
      body : SingleChildScrollView(
        child: Column( 
          children: [
            TextFormField(
              controller: filt,
              onChanged: (data1){
                if (data1!="")
                {
                  setState(() {
                    outputList = data.where((o) => o['location'].contains(data1)).toList();
                    print("hello");
                    // outputList = data.where((o) => o['name']==data1).toList();
                  });
                }
                else
                {
                  setState(() {
                    outputList=data;
                  });
                }
      
                // print(data);
              },
         ),
            Container(
              child: new ListView.builder(
                shrinkWrap: true,
                itemCount: outputList!=null?outputList.length:0,
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
                          Text('' +outputList[index]['business_name'].toString()),
                        ],
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('' +outputList[index]['category'].toString()),
                        ],
                      ),
                      // new Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Text('' +data1[index]['file'].toString()),
                      //   ],
                      // ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('starting from: ' +outputList[index]['cost'].toString()),
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
                          Text('' +outputList[index]['location'].toString()),
                        ],
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('' +outputList[index]['district'].toString()),
                        ],
                      ),
                      Container(child: ElevatedButton(
                  onPressed: () {
                    view_vendor1.srid=outputList[index]['service_id'].toString();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => view_vendor1()));
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
          ],
        ),
      ),

    );
  }
}
