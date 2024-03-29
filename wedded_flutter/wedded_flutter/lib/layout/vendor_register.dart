import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:wedded_flutter/layout/login.dart';
import 'package:wedded_flutter/layout/navigationbar2.dart';

class vendor_register extends StatefulWidget {
  const vendor_register({Key? key}) : super(key: key);

  @override
  State<vendor_register> createState() => _vendor_registerState();
  
}

class _vendor_registerState extends State<vendor_register> {
  late TextEditingController username, phone_no,email_id,city,district,state,password,re_password;
  bool validateEmail(String value) {
    var email = value;
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    print(emailValid);
    return emailValid;
  }
  bool validatephone(String value){
    var ph=value;
    bool phone=RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(ph);
    return phone;

  }
  @override
  void initState() {
    username = TextEditingController();
    phone_no = TextEditingController();
    email_id = TextEditingController();
    city = TextEditingController();
    district = TextEditingController();
    state = TextEditingController();
    password = TextEditingController();
    re_password = TextEditingController();
    super.initState();
  }
  void postdata()async {
    String url = login.url+"vendor_register/Vendor/";
    if(username.text=="")
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Required Name")));
      }
    else if(!validatephone(phone_no.text))
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Required Phone")));
      }
    else if(!validateEmail(email_id.text))
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Required Email")));
      }
    else if(city.text=="")
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Required city")));
      }
    else if(district.text=="")
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Required district")));
      }
    else if(state.text=="")
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Required State")));
      }
    else if(password.text != re_password)
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Password incorrect")));
      }
    else{
    var resp = await post(url,body:{
    "vendor_name":username.text.toString(),
    "phone_no":phone_no.text.toString(),
    "email":email_id.text.toString(),
    "city":city.text.toString(),
    "district":dropdownValue.toString(),
    "state":dropdownValue1.toString(),
    "password_1":password.text.toString(),
    "password_2":re_password.text.toString(),
    });
    Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => testing2()));
                showDialog(context: context, builder: (context) => AlertDialog(
                content: Text("Registration completed!")));
  }
  }
  List dropList2 =[
  {"devi_id":"Kozhikode", "name": "Kozhikode"},
  {"devi_id":"Thrissur", "name": "Thrissur"},
  {"devi_id":"Palakkad", "name": "Palakkad"},
  {"devi_id":"Malappuram", "name": "Malappuram"},
  {"devi_id":"Kasargode", "name": "Kasargode"},
  {"devi_id":"Kannur", "name": "Kannur"},
  {"devi_id":"Ernakulam", "name": "Ernakulam"},
  {"devi_id":"Kollam", "name": "Kollam"},
  {"devi_id":"Kottayam", "name": "Kottayam"},
  {"devi_id":"Wayanad", "name": "Wayanad"},
  {"devi_id":"Pathanamthitta", "name": "Pathanamthitta"},
  {"devi_id":"Idukki", "name": "Idukki"},
  {"devi_id":"Alappuzha", "name": "Alappuzha"},
  {"devi_id":"Thiruvananthpuram", "name": "Thiruvananthpuram"},
];

List dropList3 =[
  {"devi_id":"Kerala", "name": "Kerala"},
  {"devi_id":"Others", "name": "Others"},
];

var dropdownValue = "";
var dropdownValue1 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 36, 16),
        title: Text('VENDOR REGISTRATION'),
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
                controller: username,
                decoration: InputDecoration(labelText: 'Username',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.people)
                ),
              ),
            ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
                controller: phone_no,
                decoration: InputDecoration(labelText: 'Phone no',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.phone)
              ), 
            ),
          ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10 ),
            child: TextField(
                controller: email_id,
                decoration: InputDecoration(labelText: 'Email id',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.email)
              ), 
            ),
          ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
                controller: city,
                decoration: InputDecoration(labelText: 'City',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.location_city)
              ), 
            ),
          ),
          Container( //dropdown
    padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
    //  width: 150.0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // border: Border.all(color: Colors.black)
    ),
    child: DropdownButtonFormField(
      // labelText: 'role'
        hint: Text("District"),
        onChanged: ( newValue) {
          setState(() {
            dropdownValue = newValue.toString();
            print(dropdownValue);
          });
        },
        items: dropList2.map((item) => DropdownMenuItem(child: Text(item['name'].toString(),),value:item['devi_id'].toString(),)).toList()
    )
),
          Container( //dropdown
    padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
    //  width: 150.0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        // border: Border.all(color: Colors.black)
    ),
    child: DropdownButtonFormField(
      // labelText: 'role'
        hint: Text("State"),
        onChanged: ( newValue) {
          setState(() {
            dropdownValue1 = newValue.toString();
            print(dropdownValue);
          });
        },
        items: dropList3.map((item) => DropdownMenuItem(child: Text(item['name'].toString()),value:item['devi_id'].toString(),)).toList()
    )
          ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
                controller: password,
                decoration: InputDecoration(labelText: 'Password',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.password_rounded)
              ),
              obscureText: true, 
            ),
          ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
                controller: re_password,
                decoration: InputDecoration(labelText: 'Renter password',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.password_outlined)
              ),
              obscureText: true, 
            ),
          ),
          Container(child: ElevatedButton(
            onPressed: () {
                postdata();
            },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 78, 36, 16),
                minimumSize: Size(200, 50),
              ),
              child: Text('REGISTER')
          )
          ), 
          ]
          ),
        ),
      ),
    );  
  }
}