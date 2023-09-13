import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:wedded_flutter/layout/login.dart';
import 'package:wedded_flutter/layout/navigationbar.dart';

class review extends StatefulWidget {
  const review({Key? key}) : super(key: key);

  @override
  State<review> createState() => _reviewState();
}

class _reviewState extends State<review> {
  late TextEditingController rating,review;
  List dropList =[
    {"vendor_id":0, "vendor_name": "<Select>"},
    // {"edpt_id":1, "name": "<two>"},
  ];
  var fkey=GlobalKey<FormState>();
  var val=true;
  var dropdownValue = "";
  void gendrop() async {
    String url = login.url+"vendor_register/vdrp/";
    var resp = await get(url);
    print(resp.body);
    setState(() {
      dropList = jsonDecode(resp.body);
    });
  }
  @override
  void initState() {
    rating = TextEditingController();
    review = TextEditingController();
    super.initState();
  }
  void postdata()async {
    String url = login.url+"review/Review/";
    var resp = await post(url,body: {
      "description":review.text.toString(),
      "rating":rating.text.toString(),
      "uid":login.uid,
      "vid":dropdownValue
    });
  }
  @override
  Widget build(BuildContext context) {
    gendrop();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 36, 16),
        title: Text('REVIEW'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
          // padding: EdgeInsets.all(60),
          decoration: const BoxDecoration(
          image: DecorationImage(
          image: AssetImage("assets/sam8.jpeg"), 
          fit: BoxFit.cover
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
            Container(
              padding: EdgeInsets.fromLTRB(30, 10, 20, 10),
              child: TextField(
                controller: rating,
                decoration: InputDecoration(labelText: 'Rating',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.star)
                ),
              ),
            ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
                controller: review,
                decoration: InputDecoration(labelText: 'Review',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.description)
              ), 
            ),
          ),
          // Container(
          //   padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
          //   child: TextField(
          //       // controller: username,
          //       decoration: InputDecoration(labelText: 'upload picture',
          //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          //       suffixIcon: Icon(Icons.image)
          //     ), 
          //   ),
          // ),
              Container( //dropdown
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 10), //3rd



                  width: 350.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black)
                  ),

                  child: DropdownButtonFormField(
                      hint: Text("select the vendor"),
                      onChanged: ( newValue) {
                        setState(() {
                          dropdownValue = newValue.toString();
                          print(dropdownValue);
                        });
                      },
                      items: dropList.map((item) => DropdownMenuItem(child: Text(item['vendor_name'].toString()),value:item['vendor_id'].toString(),)).toList()
                  )

              ),
          Container(child: ElevatedButton(
            onPressed: () {
              postdata();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => testing()));
            },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 78, 36, 16),
                minimumSize: Size(200, 50),
              ),
              child: Text('UPLOAD')
          )
          ), 
          ]
          ),
        ),
      ),  
    );

    
  }
}