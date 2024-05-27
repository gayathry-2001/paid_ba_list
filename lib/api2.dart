// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:meatshopproj/modals/modal2.dart';
// import 'package:meatshopproj/url/url.dart';

import 'package:dio/dio.dart';
import 'package:flutter_project/modal2.dart';
import 'package:flutter_project/url.dart';

class Api2 {

  Api2._internal();

  static Api2 instance = Api2._internal();

  factory (){
    return instance;
  }


  final dio = Dio();
  final url = URL();

  Api2(){
    dio.options =BaseOptions(
        baseUrl: url.baseUrl2,
        responseType: ResponseType.json
    );
    dio.interceptors.add(InterceptorsWrapper());
  }


  Future <PaidBAModel?> paidbalApi (String form) async{
    try{
      final result = await dio.post(url.paidbaList,data: form);
      return PaidBAModel.fromJson((result.data));
    }
    on DioException catch(e){
      print(e);
    }
    catch(e){
      print(e);
    }
  }



}