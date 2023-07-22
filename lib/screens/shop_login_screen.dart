import 'dart:async';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/componants/form_field.dart';
import 'package:flutter_shop_app/data/local/sharep_pref.dart';
import 'package:flutter_shop_app/screens/shop_layout.dart';
import 'package:toastification/toastification.dart';


import '../componants/buttomn.dart';
import '../controller/cubit/cubit/shop_cubit_cubit.dart';
import '../data/local/myshared_keys.dart';
import 'onboarding_screen.dart';

class ShopLogin extends StatelessWidget {
  ShopLogin({super.key});
  static const text = 'ShopLogin';
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  var FormKey = GlobalKey<FormState>();
  TextEditingController Emailcontroller = TextEditingController();
  TextEditingController Passwordcontroller = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: Builder(
        builder: (context) {
          // var ispassword= context.select(( ShopLoginCubit value) => value.ispassword);
          // context.select((ShopLoginCubit value) => value.ispassword);

          return BlocConsumer<ShopLoginCubit, ShopLoginState>(
            listener: (context, state) async{


              // TODO: implement listener
              if(state is ShopLoginSuccessState){
                if(state.shopLoginModel.status!) {

                  // print(state.shopLoginModel.message);
                   // print('your tooooooken ${state.shopLoginModel.data!.token}');
                   var token =     state.shopLoginModel.data!.token ;
              await     MyShared.putString(key: MySharedKeys.token, value: token.toString());
                   print('My Shared is ${MySharedKeys.token}');
                  Toastification().show(
                context: context,
                title: '${state.shopLoginModel.message}',
               autoCloseDuration: const Duration(seconds: 3),
               backgroundColor: Colors.green,
             showProgressBar: true ,
             showCloseButton: false,
               icon: Icon(Icons.check),
);

          // MyShared.putString(key: MySharedKeys.login, value: state.shopLoginModel.data!.token!);
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                }else
                  {
                               Toastification().show(
                context: context,
                title: '${state.shopLoginModel.message}',
               autoCloseDuration: const Duration(seconds: 3),
               backgroundColor: Colors.red,
             showCloseButton: true,
             showProgressBar: true,
             closeOnClick: true ,

);
                    // Fluttertoast.showToast(
                    //     msg: '${state.shopLoginModel.message}',
                    //     toastLength: Toast.LENGTH_SHORT,
                    //     gravity: ToastGravity.BOTTOM,
                    //  //   timeInSecForIosWeb: 1,
                    //     backgroundColor: Colors.red,
                    //     textColor: Colors.red,
                    //     fontSize: 16.0
                    // );
                     print(state.shopLoginModel.message);
                  }


              }
            },
            builder: (context, state) {
              return Scaffold(
                  body: Container(
                color: Colors.white,
                height: double.infinity,
                child: Form(
                  key: FormKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/Gradient.png',
                          width: double.infinity,
                          height: 100,
                        ),
                        Image.asset('assets/images/Logo.jpg'),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Login To Your Account',
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Email
                        MyFormField(
                          hittext: "Email",
                          controller: Emailcontroller,
                          Keyboard: TextInputType.emailAddress,
                          Validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter your Email';
                            }
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        // Password
                        MyFormField(
                         SuffixIcon:  ShopLoginCubit.get(context).suffix ,
                          secureText:ShopLoginCubit.get(context).ispassword ,
                          OnPressedsuffix: (){
                            ShopLoginCubit.get(context).ChangePasswordVisibility();
                          },
                          hittext: "Password",
                          controller: Passwordcontroller,
                          Validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter your password';
                            }
                          },
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopLoginLoadingState,
                          builder: (context) => DefulltButtomnOnBoarding(
                              TextButton: 'Login',
                              onTap: () {
                                if(FormKey.currentState!.validate()){
                                   ShopLoginCubit.get(context).userLogin(
                                    email: Emailcontroller.text,
                                    password: Passwordcontroller.text
                                    );

                                }

                              }),
                          fallback: (context) => CircularProgressIndicator(
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
            },
          );
        }
      ),
    );
  }
}
