import 'package:flutter/material.dart';

import '../screens/shop_login_screen.dart';
void navigateTo(context,widget)=>Navigator.push(context, MaterialPageRoute(builder: (context)=>widget)) ; 

void navigateToRepacement(context,widget)=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>widget)) ; 
