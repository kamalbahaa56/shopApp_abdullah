import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/data/remote/dio_helper.dart';
import 'package:meta/meta.dart';

import '../../../data/endpoint.dart';
import '../../../data/model/shop_login_model.dart';

part 'shop_cubit_state.dart';

class ShopLoginCubit extends Cubit<ShopLoginState> {
  ShopLoginCubit() : super(ShopLoginInitial());
  static ShopLoginCubit get(context)=>BlocProvider.of(context);
  ShopLoginModel  ?shopLoginModel ;
  // هنا بنعمل الفنكشن اللى بنستعديها من الكيوبت 
  void userLogin({required  String email,required String password})
  {
    emit(ShopLoginLoadingState());

    DioHelper.postData(
      url: 'https://student.valuxapps.com/api/login',
      data: {
       'email' : email, 
        'password':password
      }
      ).then((value){
      shopLoginModel =    ShopLoginModel.fromJson(value.data) ;
        // print(value.data);
        // print(shopLoginModel!.data!.token.toString());
        // print(shopLoginModel!.status);
        // print(shopLoginModel!.message);
        emit(ShopLoginSuccessState(shopLoginModel!));
      }).catchError((error){
        print(error.toString());
        emit(ShopLoginErorrState(error.toString()));
      });
  }

  IconData suffix = Icons.visibility_off ;
  bool ispassword = true ;
  void ChangePasswordVisibility(){
    ispassword =! ispassword ;
    suffix =  ispassword ? Icons.visibility_off :Icons.visibility ;
    emit(ShopChangeIconVisibilityState());
  }
}


