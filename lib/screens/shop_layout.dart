import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/cubit/cubit/shop_data_cubit.dart';
import '../controller/cubit/cubit/shop_data_states.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:  cubit.currntPages,
             type: BottomNavigationBarType.fixed,
            onTap:(index){
              cubit.changePagesNav(index);
            } ,
            items: const [
                 BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Products' ) ,
                 BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categorys' ) , 
                 BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite' ) ,
                 BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings' ) ,
          ],
          ),
          appBar: AppBar(

          ),
          body: cubit.screens[cubit.currntPages],
        );
      },
    );
  }
}