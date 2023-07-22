import 'package:flutter/material.dart';

Widget DefulltButtomnOnBoarding({

  required GestureTapCallback? onTap,
  required String TextButton 
})=> InkWell(
              onTap: onTap ,
               child: Container(
                height: 57.0,
                width: 141,
                 padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.green.shade200, Colors.green.shade500]),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child:Center(child: Text(TextButton,style: TextStyle(color: Colors.white),)),
               ),
             );