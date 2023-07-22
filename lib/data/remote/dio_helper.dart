import 'package:dio/dio.dart';

class DioHelper{
 static  Dio dio = Dio() ;
 static var uri = 'https://student.valuxapps.com/api/';
  static init(){

    dio = Dio(
      // هنا بنحط الثوابت فقط 
    BaseOptions(
      baseUrl: uri,
      receiveDataWhenStatusError: true ,
    )
    );
  }
  // Function To GetData
  static Future<Response>getData({
    required String url ,
     Map<String , dynamic>? query,
    String ? token ,
  })async {
    dio.options.headers={
      'Content-Type':'application/json',
      'Authorization' :  token??'' ,
      'lang':'en' ,
    };
    return await dio.get(url,queryParameters: query);
  }


  // Function To PostData

  static postData({
     required String url ,
     Map<String , dynamic>?query,
     required Map<String , dynamic>data,
    String ?token 
  })async{
    try {
      dio.options.headers={
        'Content-Type':'application/json',
        'Authorization' : 'Bearer ${token??''}' ,
        'lang':'en' ,
      };
      Response response =await dio.post(
    url,
    data:data ,
  );
  return response ;
    } catch (e) {
      rethrow ;
    } 
 
  }


 static postFormData({
   required String url ,
   Map<String , dynamic>?query,
   required Map<String , dynamic>data,
   String ?token,
   Map<String, MultipartFile> files=const{},
 })async{
   try {
     dio.options.headers={
       'Authorization' : 'Bearer ${token??''}'
     };
     var formData=FormData.fromMap(data);
     formData.files.addAll(files.entries);
     Response response =await dio.post(
       url,
       data:formData ,
     );
     return response ;
   } catch (e) {
     rethrow ;
   }

 }
}