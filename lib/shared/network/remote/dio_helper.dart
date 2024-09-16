import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/testt====',
        receiveDataWhenStatusError: true,
        // headers: {
        //   'Content-Type':'application/json',
        //   'lang':'en'
        // }
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String,dynamic>? query,
    String lang = 'en',
    String? token,
  }) async{
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      // 'Authorization': token??'',
      'Authorization': token,
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
// ============================================>

  static Future<Response> postData({
    required String url,
    required Map<String,dynamic> data,
    Map<String,dynamic>? query,
    String lang = 'en',
    String? token,
  }) async{
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

// ============================================>
  static Future<Response> putData({
    required String url,
    required Map<String,dynamic> data,
    Map<String,dynamic>? query,
    String lang = 'en',
    String? token,
  }) async{
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
// ============================================>


}
