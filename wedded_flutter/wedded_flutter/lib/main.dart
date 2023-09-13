import 'package:flutter/material.dart';
import 'package:wedded_flutter/layout/booking.dart';
import 'package:wedded_flutter/layout/bookingview.dart';
import 'package:wedded_flutter/layout/eventlist.dart';
import 'package:wedded_flutter/layout/homepage.dart';
import 'package:wedded_flutter/layout/login.dart';
import 'package:wedded_flutter/layout/package.dart';
import 'package:wedded_flutter/layout/previous_work.dart';
import 'package:wedded_flutter/layout/profile.dart';
import 'package:wedded_flutter/layout/profilevendor.dart';
import 'package:wedded_flutter/layout/review.dart';
import 'package:wedded_flutter/layout/service.dart';
import 'package:wedded_flutter/layout/navigationbar.dart';
import 'package:wedded_flutter/layout/user_register.dart';
import 'package:wedded_flutter/layout/navigationbar2.dart';
import 'package:wedded_flutter/layout/vendor_detail.dart';
import 'package:wedded_flutter/layout/vendor_register.dart';
import 'package:wedded_flutter/layout/vendorlist.dart';

import 'layout/predict.dart';


void main() {
  runApp(MaterialApp(
    
    // initialRoute: 'login',
    debugShowCheckedModeBanner: false,
    routes: {
      '/':(context) => login(),
      '/rev':(context) => review(),
      // '/':(context) => review(),
      // '/':(context) => previous_work(),
      // '/':(context) => service(),
      // '/':(context) => package(),
      // '/':(context) => user_register(),
      // '/':(context) => booking(),
      // '/':(context) => vendordetail(),
      // '/':(context) => bookingview(),
      // '/':(context) => eventlist(),
      // '/':(context) => vendorlist(),
      // '/':(context) => testing2(),
      // '/':(context) => testing(),
      // '/':(context) => profilevendor(),
      // '/':(context) => profile(),
      // '/':(context) => homepage(),
      
    },
  ));
}