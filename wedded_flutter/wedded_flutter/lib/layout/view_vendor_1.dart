import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:wedded_flutter/layout/booking.dart';
import 'package:wedded_flutter/layout/login.dart';
import 'package:wedded_flutter/layout/view_previous_work.dart';

class view_vendor1 extends StatefulWidget {
  const view_vendor1({Key? key}) : super(key: key);
  static var srid="";
  @override
  State<view_vendor1> createState() => _view_vendor1State();
}

class _view_vendor1State extends State<view_vendor1> {
  @override
  late List data,data2;
  void view() async {
    var url = Uri.parse(login.url+"service/abc/");
    var url2 = Uri.parse(login.url+"previous_work/Previous_work/");
     Response resp2=await get(url2,
    );
    Response resp=await post(url,body: {
      'service_id': view_vendor1.srid.toString()
    });
    setState(() {
      data = jsonDecode(resp.body);
      data2=jsonDecode(resp2.body);
    });
  }
  void postdata(sid)async {
    String url3 = login.url + "shortlist/shrt/";
    Response res=await post(url3,body: {
      "uid":login.uid,
      "sid":sid
    });
  }
  // void view1() async {
  //   var url = Uri.parse("http://192.168.137.120:8000/service/view1/");
  //   Response resp=await post(url,body: {
  //     'service_id': view_vendor1.srid
  //   });
  //   setState(() {
  //     data = jsonDecode(resp.body);
  //   });
  // }
  // void view2() async {
  //   var url = Uri.parse("http://192.168.137.120:8000/previous_work/Previous_work/");
  //   Response resp=await post(url,body: {
  //     'service_id': view_vendor1.srid.toString()
  //   });
  //   setState(() {
  //     data2 = jsonDecode(resp.body);
  //   });
  // }
  @override
  void initState() {
    view();

    // view1();
    // view2();
  }
  Widget build(BuildContext context) {
    view();
    // view1();
    // view2();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 36, 16),
        title: Text("WEDDED"),
      ),
      body :
       Container(
        child: new ListView.builder(
          itemCount: data!=null?data.length:0,
          // itemCount1:data1!=null?data2.length:0,
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
                //     Text('' +data2[index]['file'].toString()),
                //   ],
                // ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('' +data[index]['business_name'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('' +data[index]['category'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('SERVICES: ' +data[index]['services'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('STARTING FROM: ' +data[index]['cost'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('' +data[index]['city'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('' +data[index]['district'].toString()),
                  ],
                ),
                // new Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text('' +data1[index]['state'].toString()),
                //   ],
                // ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('LINK: ' +data[index]['any_link'].toString()),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('ABOUT: ' +data[index]['about'].toString()),
                  ],
                ),
                // MyWidget(),
          //       Container(child: ElevatedButton(
          //   onPressed: () {
          //     Navigator.of(context).push(MaterialPageRoute(
          //       builder: (BuildContext context) => booking()));
          //   },
          //     style: ElevatedButton.styleFrom(
          //       primary: Color.fromARGB(255, 78, 36, 16),
          //       minimumSize: Size(200, 50),
          //     ),
          //     child: Text('BOOK NOW')
          // )
          // ),
          // Container(child: ElevatedButton(
          //   onPressed: () {
          //     Navigator.of(context).push(MaterialPageRoute(
          //       builder: (BuildContext context) => booking()));
          //   },
          //     style: ElevatedButton.styleFrom(
          //       primary: Color.fromARGB(255, 78, 36, 16),
          //       minimumSize: Size(200, 50),
          //     ),
          //     child: Text('SHORTLIST')
          // )
          // ),
          Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    ElevatedButton(
      onPressed: () {
        booking.v_id=data[index]['vendor_id'].toString();
        Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => booking()));
      },
      style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 78, 36, 16),
                minimumSize: Size(100, 50),
              ),
      child: Text('BOOK NOW'),
    ),
    ElevatedButton(
      onPressed: () {
postdata(data[index]['service_id'].toString());
showDialog(context: context, builder: (context) => AlertDialog(
    content: Text("shortlisted")));
      },
      style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 78, 36, 16),
                minimumSize: Size(100, 50),
              ),
      child: Text('SHORTLIST'),
    ),
    ElevatedButton(
      onPressed: () {
        vprework.vid=data[index]['vendor_id'].toString();
        // booking.v_id=data[index]['vendor_id'].toString();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => vprework()));
      },
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 78, 36, 16),
        minimumSize: Size(50, 50),
      ),
      child: Text('PREVIOUS WORK'),
    ),
  ],
)
              ],
              ),),
            );
          }),
      ),
    );
  }
}

// class MyWidget extends StatefulWidget {
//   const MyWidget({Key? key}) : super(key: key);

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   late List data2;
//    void view2() async {
//     var url = Uri.parse("http://172.20.10.6:8000/previous_work/Previous_work/");
//     Response resp=await get(url,
//     // body: {
//     //   'service_id': view_vendor1.srid.toString()
//     // });
//     );
//     setState(() {
//       data2 = jsonDecode(resp.body);
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     view2();
//      return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Color.fromARGB(255, 78, 36, 16),
//         title: Text("WEDDED"),
//       ),
//       body : Container(
//         child: new ListView.builder(
//           itemCount: data2!=null?data2.length:0,
//           itemBuilder: (BuildContext context, int index){
//             return new Padding(
//               padding: EdgeInsets.fromLTRB(20, 30, 20, 30), 
//               child: new Card(child: Column(mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget> [
//                 new SizedBox(
//                   height: 20,
//                 ),
//                 // new Row(
//                 //   mainAxisAlignment: MainAxisAlignment.start,
//                 //   children: [
//                 //     Text('' +data2[index]['file'].toString()),
//                 //   ],
//                 // ),
//                 new Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text('' +data2[index]['file_type'].toString()),
//                   ],
//                 ),
//                 // new Row(
//                 //   mainAxisAlignment: MainAxisAlignment.start,
//                 //   children: [
//                 //     Text('' +data2[index]['category'].toString()),
//                 //   ],
//                 // ),
//                 // new Row(
//                 //   mainAxisAlignment: MainAxisAlignment.start,
//                 //   children: [
//                 //     Text('SERVICES: ' +data2[index]['services'].toString()),
//                 //   ],
//                 // ),
//                 // new Row(
//                 //   mainAxisAlignment: MainAxisAlignment.start,
//                 //   children: [
//                 //     Text('STARTING FROM: ' +data2[index]['cost'].toString()),
//                 //   ],
//                 // ),
//                 // new Row(
//                 //   mainAxisAlignment: MainAxisAlignment.start,
//                 //   children: [
//                 //     Text('' +data2[index]['city'].toString()),
//                 //   ],
//                 // ),
//                 // new Row(
//                 //   mainAxisAlignment: MainAxisAlignment.start,
//                 //   children: [
//                 //     Text('' +data2[index]['district'].toString()),
//                 //   ],
//                 // ),
//                 // // new Row(
//                 // //   mainAxisAlignment: MainAxisAlignment.start,
//                 // //   children: [
//                 // //     Text('' +data1[index]['state'].toString()),
//                 // //   ],
//                 // // ),
//                 // new Row(
//                 //   mainAxisAlignment: MainAxisAlignment.start,
//                 //   children: [
//                 //     Text('LINK: ' +data2[index]['any_link'].toString()),
//                 //   ],
//                 // ),
//                 // new Row(
//                 //   mainAxisAlignment: MainAxisAlignment.start,
//                 //   children: [
//                 //     Text('ABOUT: ' +data2[index]['about'].toString()),
//                 //   ],
//                 // ),
//           //       Container(child: ElevatedButton(
//           //   onPressed: () {
//           //     Navigator.of(context).push(MaterialPageRoute(
//           //       builder: (BuildContext context) => booking()));
//           //   },
//           //     style: ElevatedButton.styleFrom(
//           //       primary: Color.fromARGB(255, 78, 36, 16),
//           //       minimumSize: Size(200, 50),
//           //     ),
//           //     child: Text('BOOK NOW')
//           // )
//           // ),
//           // Container(child: ElevatedButton(
//           //   onPressed: () {
//           //     Navigator.of(context).push(MaterialPageRoute(
//           //       builder: (BuildContext context) => booking()));
//           //   },
//           //     style: ElevatedButton.styleFrom(
//           //       primary: Color.fromARGB(255, 78, 36, 16),
//           //       minimumSize: Size(200, 50),
//           //     ),
//           //     child: Text('SHORTLIST')
//           // )
//           // ),
//               ],
//               ),),
//             );
//           }),
//       ),

//     );
//   }
// }