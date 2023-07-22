part of 'shop_cubit_cubit.dart';

@immutable
abstract class ShopLoginState {}

class ShopLoginInitial extends ShopLoginState {}

class ShopLoginLoadingState extends ShopLoginState {}

class ShopLoginSuccessState extends ShopLoginState {
 final ShopLoginModel shopLoginModel ;
  ShopLoginSuccessState(this.shopLoginModel) ;
}

class ShopLoginErorrState extends ShopLoginState {
  // هبعت معاه الايرور علشان اظهره على الاسكرين
  final String Error ; 
  ShopLoginErorrState(this.Error);
}
class ShopChangeIconVisibilityState extends ShopLoginState {}