import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:wedded_flutter/layout/bookingview.dart';
import 'package:wedded_flutter/layout/homepage.dart';
import 'package:wedded_flutter/layout/list_to_predict.dart';
import 'package:wedded_flutter/layout/login.dart';
import 'package:wedded_flutter/layout/menu_draw.dart';
import 'package:wedded_flutter/layout/predict.dart';
import 'package:wedded_flutter/layout/profile.dart';
import 'package:wedded_flutter/layout/vendorlist.dart';
import 'package:wedded_flutter/layout/viewbookingstatus.dart';
import 'package:wedded_flutter/layout/viw_shortlist.dart';

class testing extends StatefulWidget {
  const testing({Key? key}) : super(key: key);
  static var sdata = [];
  @override
  State<testing> createState() => _testingState();
}

class _testingState extends State<testing> {
  late List data;
  var len = 0;
  void List_function() async {
    var url = Uri.parse(login.url + "service/ll/");
    Response resp1 = await get(url);
    this.setState(() {
      data = jsonDecode(resp1.body);
      for (int i = 0; i < data.length; i++) {
        testing.sdata.add(data[i]['business_name'].toString() +
            " ," +
            data[i]['location'].toString());
      }
      len = data.length;
    });
    print(resp1.body);
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    // index=0;
    setState(() {
      _selectedIndex = index;
      // _onItemTapped(_selectedIndex);
      // _onItemTapped(index);
      print(index.toString());
      if (index == 0) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => predict_list()));
      } else if (index == 1) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => profile()));
      } else if (index == 2) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => bookstatusview()));
      }
      // else if(index==3)
      // {
      //   Navigator.of(context).push(MaterialPageRoute(
      //       builder: (BuildContext context) => vendorlist()));
      // }
    });
  }

  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List_function();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 36, 16),
        title: Text('WEDDED'),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.of(context).push(MaterialPageRoute(
        //         builder: (BuildContext context) => draw()));
        //   },
        //   icon: Icon(Icons.menu),
        // ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate());
            },
            icon: const Icon(Icons.search),
          ),
          // IconButton(
          // onPressed: () {},
          // icon: const Icon(Icons.notifications),
          // ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => vwshrt()));
            },
            icon: const Icon(Icons.bookmark),
          ),
        ],
        // centerTitle: true,
      ),
      drawer: draw(),
      body: Container(
        child: Center(
          child: Container(
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40.0,
                          backgroundImage: AssetImage('assets/sam7.jpeg'),
                          // backgroundImage: ,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 20, 30),
                          child: Text(
                            'Welcome ',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                    alignment: AlignmentDirectional.center,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 78, 36, 16),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.store),
                  title: Text('Vendors'),
                  onTap: () {
                    // Navigator.pop(context);
                    // Navigator.pushNamed(context, '');
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => vendorlist()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.store),
                  title: Text('Predict'),
                  onTap: () {
                    // Navigator.pop(context);
                    // Navigator.pushNamed(context, '');
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => predict()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                  onTap: () {
                    // Navigator.pop(context);
                    // Navigator.pushNamed(context, '');
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => profile()));
                  },
                ),
                // ListTile(
                //   leading: Icon(Icons.bookmark_add),
                //   title: Text('Shorlists'),
                //   onTap: (){
                //     // Navigator.pop(context);
                //     Navigator.pushNamed(context, '');
                //   },
                // ),
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text('Give us feedback'),
                  onTap: () {
                    // Navigator.pop(context);
                    Navigator.pushNamed(context, '/rev');
                  },
                ),

                // ListTile(
                //   leading: Icon(Icons.share),
                //   title: Text('Share'),
                //   onTap: (){
                //     // Navigator.pop(context);
                //     Navigator.pushNamed(context, '');
                //   },
                // ),
                // ListTile(
                //   leading: Icon(Icons.settings),
                //   title: Text('Settings'),
                //   onTap: (){
                //     // Navigator.pop(context);
                //     Navigator.pushNamed(context, '');
                //   },
                // ),
              ],
            ),
          ),
        ),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/sam8.jpeg'),
          fit: BoxFit.cover,
        )),
        // child: new ListView.builder(
        //   // itemCount: data == null ? 0 : data.length,
        //   itemCount: len,
        //   itemBuilder: (context, index) {
        //     return new Padding(
        //       padding: new EdgeInsets.fromLTRB(20, 05, 10, 5),
        //       child: new Card(
        //         elevation: 2.0,
        //         shape: new RoundedRectangleBorder(
        //             borderRadius: new BorderRadius.circular(16.0)
        //         ),
        //         child: InkWell(
        //           onTap: () {
        //             // if(index==0)
        //             // {
        //             //   // view_vendor.ftype="Bridal_Makeup";
        //             //   // Navigator.of(context).push(MaterialPageRoute(
        //             //   //     builder: (BuildContext context) => const view_vendor()));
        //             // }
        //           },
        //           child: new Column(
        //             children: <Widget>[
        //               new Padding(
        //                 padding: new EdgeInsets.all(16.0),
        //                 child: new Column(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   crossAxisAlignment: CrossAxisAlignment.center,
        //                   children: <Widget>[
        //                     // Image.network(mainpage.url+"static/"+data[index]['pmr'].toString()),
        //                     new Text(data[index]['vendor_name'].toString(),
        //                       style: Theme
        //                           .of(context)
        //                           .textTheme
        //                           .titleMedium,
        //                     ),
        //                     new Text(data[index]['phone_no'].toString(),
        //                       style: Theme
        //                           .of(context)
        //                           .textTheme
        //                           .titleMedium,
        //                     ),
        //                     new Text(data[index]['email'].toString(),
        //                       style: Theme
        //                           .of(context)
        //                           .textTheme
        //                           .titleMedium,
        //                     ),
        //                   ],
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // )
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(93, 181, 186, 196),
        // elevation: 0,
        items: const <BottomNavigationBarItem>[
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   label: 'Home',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Vendors',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
// // Demo list to show querying
//   List<String> searchTerms = [
//     "Apple",
//     "Banana",
//     "Mango",
//     "Pear",
//     "Watermelons",
//     "Blueberries",
//     "Pineapples",
//     "Strawberries"
//   ];

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in testing.sdata) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in testing.sdata) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
