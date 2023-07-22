import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/data/local/sharep_pref.dart';
import 'package:flutter_shop_app/screens/onboarding_screen.dart';
import 'package:flutter_shop_app/screens/shop_layout.dart';
import 'package:flutter_shop_app/screens/shop_login_screen.dart';

import 'controller/cubit/cubit/shop_cubit_cubit.dart';
import 'controller/cubit/cubit/shop_data_cubit.dart';
import 'data/local/myshared_keys.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await MyShared.init() ; 
  bool Onboarding =  MyShared.getBoolean(key: MySharedKeys.onboarding);
  String token =  MyShared.getString(key: MySharedKeys.token);
  print('the token is $token');
  Widget widget ; 
  if (Onboarding ) {
    if (token.isNotEmpty) {
        widget = const HomeScreen();
    } else {
      widget = ShopLogin();
    }
  }else{
    widget = OnBoardingScreen();
  }
  runApp( MyApp(
    Onboarding: Onboarding,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final bool Onboarding ;
  final Widget startWidget ; 
   MyApp({super.key, required this.Onboarding , required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>ShopLoginCubit()) , 
        BlocProvider(create: (context)=>ShopCubit()..getHomeData())
      ],
      child: MaterialApp(
       home:startWidget,
      ),
    );
  }
}

