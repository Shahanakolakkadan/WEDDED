import 'package:flutter/material.dart';
import 'package:wedded_flutter/layout/login.dart';
import 'package:http/http.dart';
import 'package:wedded_flutter/layout/output.dart';

class nwpred extends StatefulWidget {
  const nwpred({Key? key}) : super(key: key);

  @override
  State<nwpred> createState() => _nwpredState();
}

class _nwpredState extends State<nwpred> {
  List dropList =[
    {"l_id":"1", "loc": "Kozhikode"},
    {"l_id":"2", "loc": "Malappuram"},
    {"l_id":"3", "loc": "vadakara"},
    {"l_id":"4", "loc": "Thrissur"},
  ];
  List dropList1 =[
    {"b_id":"1", "bud": "50000"},
    {"b_id":"2", "bud": "100000"},
    {"b_id":"3", "bud": "150000"},
    {"b_id":"4", "bud": "200000"},
  ];
  // List dropList2 =[
  //   {"p_id":"1", "pp": "100"},
  //   {"p_id":"2", "pp": "500"},
  //   {"p_id":"3", "pp": "1000"},
  //   {"p_id":"4", "pp": "1500"},
  // ];
  List dropList3 =[
    {"t_id":"1", "type": "Bridal Makeup"},
    {"t_id":"2", "type": "Bridal Mehandi"},
    {"t_id":"3", "type": "Photography"},
    // {"t_id":"4", "type": "Event management"},
  ];
  List dropList4 =[
    {"r_id":"1", "rat": "1"},
    {"r_id":"2", "rat": "2"},
    {"r_id":"3", "rat": "3"},
    {"r_id":"4", "rat": "4"},
    {"r_id":"5", "rat": "5"},
  ];
  var dropdownvalue="";
  var dropdownvalue1="";
  var dropdownvalue2="";
  var dropdownvalue3="";
  var dropdownvalue4="";
  // late TextEditingController location,budget,noofpeople,type,Rating;
  // @override
  // void initState() {
  //   location = TextEditingController();
  //   budget = TextEditingController();
  //   noofpeople = TextEditingController();
  //   type = TextEditingController();
  //   Rating = TextEditingController();
  //   super.initState();
  // }
  var res="";
  void postdata()async {
    String url = login.url+ "booking/nw/";
    var resp = await post(url,body:{
      "location":dropdownvalue,
      "budget":dropdownvalue1,
      // "noofpeople":dropdownvalue2,
      "type":dropdownvalue3,
      "rating":dropdownvalue4
    });

    setState(() {
      res=resp.body.toString();
      print(res);
      // data = jsonDecode(resp.body);
      // print(data);
    });
  }
  // setState(() {
  // data = jsonDecode(resp.body);
  // print(data);
  // });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 36, 16),
        title: Text('PREDICT'),
      ),
      body: Container(
        child: Column(
          children: [
            Container( //dropdown
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10), //3rd
                width: 350.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black)
                ),
                child: DropdownButtonFormField(
                    hint: Text("select the location"),
                    onChanged: ( newValue) {
                      setState(() {
                        dropdownvalue = newValue.toString();
                        print(dropdownvalue);
                      });
                    },
                    items: dropList.map((item) => DropdownMenuItem(child: Text(item['loc'].toString()),value:item['l_id'].toString(),)).toList()
                )
            ),
            Container( //dropdown
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10), //3rd
                width: 350.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black)
                ),
                child: DropdownButtonFormField(
                    hint: Text("select the type"),
                    onChanged: ( newValue) {
                      setState(() {
                        dropdownvalue3 = newValue.toString();
                        print(dropdownvalue3);
                      });
                    },
                    items: dropList3.map((item) => DropdownMenuItem(child: Text(item['type'].toString()),value:item['t_id'].toString(),)).toList()
                )
            ),
            Container( //dropdown
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10), //3rd
                width: 350.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black)
                ),
                child: DropdownButtonFormField(
                    hint: Text("select the Budget"),
                    onChanged: ( newValue) {
                      setState(() {
                        dropdownvalue1 = newValue.toString();
                        print(dropdownvalue1);
                      });
                    },
                    items: dropList1.map((item) => DropdownMenuItem(child: Text(item['bud'].toString()),value:item['b_id'].toString(),)).toList()
                )
            ),
            // Container( //dropdown
            //     padding: EdgeInsets.fromLTRB(20, 0, 20, 10), //3rd
            //     width: 350.0,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(20),
            //         border: Border.all(color: Colors.black)
            //     ),
            //     child: DropdownButtonFormField(
            //         hint: Text("No of people"),
            //         onChanged: ( newValue) {
            //           setState(() {
            //             dropdownvalue2 = newValue.toString();
            //             print(dropdownvalue2);
            //           });
            //         },
            //         items: dropList2.map((item) => DropdownMenuItem(child: Text(item['pp'].toString()),value:item['p_id'].toString(),)).toList()
            //     )
            // ),
            Container( //dropdown
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10), //3rd
                width: 350.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black)
                ),
                child: DropdownButtonFormField(
                    hint: Text("Select rating"),
                    onChanged: ( newValue) {
                      setState(() {
                        dropdownvalue4 = newValue.toString();
                        print(dropdownvalue4);
                      });
                    },
                    items: dropList4.map((item) => DropdownMenuItem(child: Text(item['rat'].toString()),value:item['r_id'].toString(),)).toList()
                )
            ),
            Container(
                child: ElevatedButton(
                    onPressed: () {
                      postdata();
                      outp.rs=res.toString();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => outp()));
                      // postdata();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 78, 36, 16),
                      minimumSize: Size(200, 50),
                    ),
                    child: Text('POST')
                )
            ),
            // Container(
            //   child: Text(res),
            // )



          ],
        ),
      ),
    );
  }
}
