import 'package:flutter/material.dart';

Widget MyFormField ({
  required String hittext , 
  required TextEditingController controller ,
            TextInputType? Keyboard , 
  required FormFieldValidator<String> Validator, 
    bool secureText = false,
   VoidCallback? OnPressedsuffix,
  IconData ? SuffixIcon ,

})=>Padding(
  padding: const EdgeInsets.all(10.0),
  child:   TextFormField(
  
             validator: Validator,
  
             keyboardType:Keyboard ,
  
            controller: controller,
            obscureText:secureText ,

            decoration: InputDecoration(
                suffixIcon: IconButton(onPressed:OnPressedsuffix, icon:Icon(SuffixIcon)),
              border: OutlineInputBorder(
  
                borderRadius: BorderRadius.circular(20),
  
             //   borderSide: BorderSide(width:2,color: Colors.grey,strokeAlign: 10,style: BorderStyle.none) ,
  
              ),
  
              hintText: hittext, 
  
            ),
  
          ),
);