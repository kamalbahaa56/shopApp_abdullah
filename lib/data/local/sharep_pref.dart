import 'package:shared_preferences/shared_preferences.dart';

import 'myshared_keys.dart';



class MyShared {
 static SharedPreferences? preferences ;

 static Future<void> init()async{
  preferences =await SharedPreferences.getInstance();
 }

static putString({required MySharedKeys key ,required String value})async{
  await preferences?.setString(key.name, value);
 }

 static  String getString({required MySharedKeys key}){
  return preferences?.getString(key.name) ?? "";
 }


 static putInt({required MySharedKeys key ,required int value})async{
  await preferences?.setInt(key.name, value);
 }
 static int getInt({required MySharedKeys key}){
  return preferences?.getInt(key.name) ?? 0;
 }
 static putDouble({required MySharedKeys key ,required double value})async{
  await preferences?.setDouble(key.name, value);
 }
 static double getDouble({required MySharedKeys key}){
  return preferences?.getDouble(key.name) ?? 0.0;
 }
 static putBoolean({required MySharedKeys key ,required bool value})async{
  await preferences?.setBool(key.name, value);
 }
 static bool getBoolean({required MySharedKeys key}){
  return preferences?.getBool(key.name) ?? false;
 }
 static Future<void> removeFormShared({required MySharedKeys key})
 async{
  await preferences?.remove(key.name);
 }

 static Future<void>clearShared()async{
  await preferences?.clear();
 }





}