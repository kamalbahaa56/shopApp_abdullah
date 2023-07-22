import 'package:flutter/material.dart';
import 'package:flutter_shop_app/screens/shop_login_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../componants/buttomn.dart';
import '../componants/navigate_screens.dart';
import '../data/local/myshared_keys.dart';
import '../data/local/sharep_pref.dart';
    class BoardingModel{
      final String  image ; 
      final String title ; 
      final String subtitle ; 
      BoardingModel(this.image,this.subtitle,this.title) ;
    }
class OnBoardingScreen extends StatefulWidget {
   OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
   List <BoardingModel>bording = [
    BoardingModel('assets/images/Illustartion.svg', 'Here You Can find a chef or dish for every taste and color. Enjoy!', 'Find your  Comfort Food here',) , 
BoardingModel('assets/images/Illustration.svg', 'Enjoy a fast and smooth food delivery at your doorstep', 'Food Ninja is Where Your Comfort Food Lives',) , 
   ];

   var boardController = PageController();
    bool IsLast = false;
    void sbmit()async{
 await    MyShared.putBoolean(key: MySharedKeys.onboarding, value: true);
     navigateToRepacement(context, ShopLogin());
 
    }   
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:PageView.builder(
          onPageChanged: (int index){
            if(index==bording.length-1){
            //  print('last');
            setState(() {
              IsLast=true;
            });
            }else{
               setState(() {
              IsLast=false;
            });
            }
          },
          controller: boardController,
          physics: BouncingScrollPhysics(),
          itemCount: bording.length,
          itemBuilder: (context,index){
          return Column(
            children: [
              ItemOnBoradingScreen(bording[index]),
            DefulltButtomnOnBoarding(onTap: (){
               if (IsLast==true) {
              //   Navigator.pushNamed(context, 'Shoplogin');
             // navigateTo(context, ShopLogin());navigateToRepacement
              sbmit();
               } else {
                  boardController.nextPage(duration: Duration(milliseconds: 100), curve: Curves.fastLinearToSlowEaseIn); 
               }
            },TextButton: 'Next')
            ],
          );
        }
        )
      ),
    );
  }

  Widget ItemOnBoradingScreen(BoardingModel model){

    return Column(
        children: [
           SvgPicture.asset('${model.image}',width: 408.5,height: 434.22,), 
           Container(
           
            padding: EdgeInsets.all(40),
            alignment: Alignment.center,
            child: Column(
              children: [
                  Text('${model.title}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),textAlign: TextAlign.center,) ,
                  SizedBox(height: 20,),
                  Text('${model.subtitle}',style: TextStyle(fontSize: 12),textAlign: TextAlign.center,),
              ],
            )
           ) ,
          
        ],
      );
  }
}
  // Container(
  //         margin: EdgeInsets.symmetric(horizontal: 30.0),
  //         alignment: Alignment.center,
  //         width: double.infinity,
  //         height: 50.0,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.all(Radius.circular(8.0)),
  //           gradient: LinearGradient(
  //             colors: [
  //               Colors.red[100],
  //               Colors.red[900],
  //             ]
  //           ),
  //           boxShadow: [
  //             BoxShadow(
  //               offset: Offset(0, 0),
  //               color: Colors.red[100],
  //               blurRadius: 16.0,
  //             ),
  //             BoxShadow(
  //               offset: Offset(0, 0),
  //               color: Colors.red[200],
  //               blurRadius: 16.0,
  //             ),
  //             BoxShadow(
  //               offset: Offset(0, 0),
  //               color: Colors.red[300],
  //               blurRadius: 16.0,
  //             ),
  //           ]
  //         ),
  //         child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 18.0))
  //       ),
  //     )
  