import 'package:flutter/material.dart';
import 'package:wedded_flutter/layout/bookingview.dart';
import 'package:wedded_flutter/layout/homepage.dart';
import 'package:wedded_flutter/layout/menu_draw.dart';
import 'package:wedded_flutter/layout/previous_work.dart';
import 'package:wedded_flutter/layout/profile.dart';
import 'package:wedded_flutter/layout/profilevendor.dart';
import 'package:wedded_flutter/layout/service.dart';
import 'package:wedded_flutter/layout/vendor_detail.dart';
import 'package:wedded_flutter/layout/vendorlist.dart';

class testing2 extends StatefulWidget {
  const testing2({Key? key}) : super(key: key);
  @override
  State<testing2> createState() => _testing2State();
}
class _testing2State extends State<testing2> {
int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(index.toString());

      if(index==0)
        {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => vendordetail()));
        }
      else if(index==1)
        {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => profilevendor()));
        }
        else if(index==2)
        {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => bookingview()));
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 36, 16),
        title: Text('WEDDED'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => draw()));
          },
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
          ),
          IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
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
                  title: Text('Services'),
                  onTap: () {
                    // Navigator.pop(context);
                    // Navigator.pushNamed(context, '');
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => service()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.store),
                  title: Text('Previous work'),
                  onTap: () {
                    // Navigator.pop(context);
                    // Navigator.pushNamed(context, '');
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => previous_work()));
                  },
                ),
                // ListTile(
                //   leading: Icon(Icons.store),
                //   title: Text('Predict'),
                //   onTap: () {
                //     // Navigator.pop(context);
                //     // Navigator.pushNamed(context, '');
                //     Navigator.of(context).push(MaterialPageRoute(
                //         builder: (BuildContext context) => predict()));
                //   },
                // ),
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
                // ListTile(
                //   leading: Icon(Icons.message),
                //   title: Text('Give us feedback'),
                //   onTap: () {
                //     // Navigator.pop(context);
                //     Navigator.pushNamed(context, '/rev');
                //   },
                // ),

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
    
      // body: Center(
      //   child: _pages.elementAt(_selectedIndex),
      //   ),
      // BottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Color.fromARGB(93, 181, 186, 196),
      //   // elevation: 0,
      //   items: const <BottomNavigationBarItem>[
      //     // BottomNavigationBarItem(
      //     //   icon: Icon(Icons.home),
      //     //   label: 'Home',
      //     // ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.store),
      //       label: 'Vendors',
      //     ),

      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),

      //     BottomNavigationBarItem(

      //       icon: Icon(Icons.dashboard),
      //       label: 'Dashboard',

      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      // ),
    );
  }
}