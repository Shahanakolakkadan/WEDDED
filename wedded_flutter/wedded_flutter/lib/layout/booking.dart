import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:wedded_flutter/layout/login.dart';
import 'package:wedded_flutter/layout/navigationbar.dart';
class booking extends StatefulWidget {
  const booking({Key? key}) : super(key: key);

  @override
  State<booking> createState() => _bookingState();
  static var v_id="";
}

class _bookingState extends State<booking> {
  late TextEditingController name, phone_no, email, function_date, Details;

  DateTime selectedDate = DateTime.now();

  late TextEditingController dob,dob1;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1850, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        function_date.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
  }
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
    name = TextEditingController();
    phone_no = TextEditingController();
    email = TextEditingController();
    function_date = TextEditingController();
    Details = TextEditingController();
    super.initState();
  }
  void postdata()async {
    String url = login.url+"/booking/Booking/";
    if(!validatephone(phone_no.text))
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Required Phone")));
      }
    else if(!validateEmail(email.text))
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Required Email")));
      }
      else{
    var resp = await post(url,body : {
      "name" : name.text.toString(),
      "phone_no" : phone_no.text.toString(),
      "email" : email.text.toString(),
      "function_date" :function_date.text.toString(),
      "details" : Details.text.toString(),
      "uid":login.uid,
      "vid":booking.v_id
    });
    Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => testing()));
                 showDialog(context: context, builder: (context) => AlertDialog(
                 content: Text("Booked successfully!")));
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 36, 16),
        title: Text('BOOKING'),
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
                controller: name,
                decoration: InputDecoration(labelText: 'Name',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.people)
                ),
              ),
            ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
                controller: phone_no,
                decoration: InputDecoration(labelText: 'Phone NO',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.phone)
              ), 
            ),
          ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
                controller: email,
                decoration: InputDecoration(labelText: 'Email',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.email)
              ), 
            ),
          ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
                controller: function_date,
                decoration: InputDecoration(labelText: 'Function Date',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                suffixIcon: Icon(Icons.date_range)
              ),
              onTap: (){
                _selectDate(context);
              },
            ),
          ),
          Container(
            padding:  EdgeInsets.fromLTRB(30, 10, 20, 10),
            child: TextField(
                controller: Details,
                decoration: InputDecoration(labelText: 'Details Of Wedding',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                contentPadding: EdgeInsets.symmetric(vertical: 60),
                suffixIcon: Icon(Icons.description)
              ), 
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
              child: Text('SEND MESSAGE')
          )
          ), 
          ]
          ),
        ),
      ),  
    );

    
  }
}