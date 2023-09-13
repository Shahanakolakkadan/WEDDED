import 'package:flutter/material.dart';
class checkbox extends StatefulWidget {
  const checkbox({Key? key}) : super(key: key);

  @override
  State<checkbox> createState() => _checkboxState();
}

class _checkboxState extends State<checkbox> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 36, 16),
        title: Text('WEDDED'),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(100, 200, 100, 200),
          child: Column(
            children: [
              Container(
                padding:  EdgeInsets.fromLTRB(30, 20, 10, 20),
                child: TextField(
                  // controller: description,
                  decoration: InputDecoration(labelText: 'Package Description',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                  contentPadding: EdgeInsets.symmetric(vertical: 60),
                  suffixIcon: Icon(Icons.description)
                  ), 
                ),
              ),
              Container(child: ElevatedButton(
            onPressed: () {
              // postdata();
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (BuildContext context) => vendordetail()));
            },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 78, 36, 16),
                minimumSize: Size(200, 50),
              ),
              child: Text('SUBMIT')
          )
          ),
            ],
          ),
        ),
      )
    );
  }
}