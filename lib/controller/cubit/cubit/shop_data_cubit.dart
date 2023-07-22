import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/controller/cubit/cubit/shop_cubit_cubit.dart';
import 'package:flutter_shop_app/controller/cubit/cubit/shop_data_states.dart';
import 'package:flutter_shop_app/data/endpoint.dart';
import 'package:flutter_shop_app/data/local/myshared_keys.dart';
import 'package:flutter_shop_app/data/local/sharep_pref.dart';
import 'package:flutter_shop_app/screens/catergories_screen.dart';
import 'package:flutter_shop_app/screens/favorites_screen.dart';
import 'package:flutter_shop_app/screens/products_screen.dart';
import 'package:flutter_shop_app/screens/settings_screen.dart';

import '../../../data/model/shop_home_model.dart';
import '../../../data/remote/dio_helper.dart';

// ignore: empty_constructor_bodies
class ShopCubit extends Cubit<ShopStates>
{
  ShopCubit() : super (ShopInitialStates());
  
  static ShopCubit get(context)=>BlocProvider.of(context);
  int currntPages = 0 ;
   
   List <Widget> screens = 
   [
    ProductsScreen(),
     CategoriesScreen() ,
    FavoritesScreen(),
    SettingsScreen(),
   ];
  ShopHomeModel ? shopHomeModel;
  String token =  MyShared.getString(key: MySharedKeys.token);
   void changePagesNav(int index){
    currntPages = index ; 
    emit(ChangeButtomNavStates()) ;
   }

   void getHomeData(){
     emit(ShopLoadingDataStates());
     DioHelper.getData(
       token: token ,
         url:DioHelper.uri+'$HOME').then((value){
       print(DioHelper.uri+'$HOME');
       print(token);
       shopHomeModel = ShopHomeModel.fromJson(value.data) ;
       print(shopHomeModel!.data!.banners![0].image);
       print("the status is ${shopHomeModel!.status}");
       print("the ID is ${shopHomeModel!.data!.banners![0].id}");
       print("the image is ${shopHomeModel!.data!.products![0].image}");
       print("the name is ${shopHomeModel!.data!.products![0].name}");
       emit(ShopSuccessDataStates());
     }).catchError((error){
       print(error.toString());
     });
   }
  }