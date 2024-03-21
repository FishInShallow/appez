import 'dart:async';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:appez/common/config.dart';
import 'package:appez/models/result.dart';

class BaseRquest {
  
  BaseRquest() {  _onInit(); }
  late Dio _dio;

  void _onInit() {
    _dio = Dio(BaseOptions(
      baseUrl: Config.baseUrl,
      sendTimeout: 3*1000,
      validateStatus: (status) => true,
      // connectTimeout: 2*1000,
    ));
    /// https 校验
    if(Config.debugMode) {
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client){
        client.badCertificateCallback=(cert, host, port){
          return true;
        };
        return null;
      };
    }
    /// 拦截器
    _dio.interceptors.add(_interceptors()) ;
  }
  
  /// 通用请求方法 cRequest
  Future<Result> cRequest( String url, { String method = 'GET', dynamic data, Map<String,dynamic>? query,dynamic Function(int,int)? uploadProgress}) async {
    Map<String,dynamic>? map = query?.map((name,value)=>MapEntry(name,value.toString()));
    Response response = await _dio.request(url, options:Options(method: method), data: data, queryParameters: map,onSendProgress: uploadProgress);
    Result result = Result.fromJson(response.data);
    if(response.statusCode==HttpStatus.ok){ 
      return result;
    }
    if(response.statusCode==HttpStatus.unauthorized){
      return result;
    }
    result.code = 1;
    return result;
  }

  /// 拦截器
  InterceptorsWrapper _interceptors(){
    return InterceptorsWrapper(
      /// 请求拦截器
      onRequest: (options, handler){
        
        return handler.next(options); //continue
      },
      /// 返回拦截器
      onResponse: (response,handler) {
        return handler.next(response); // continue
        // 如果你想终止请求并触发一个错误,你可以 reject 一个`DioError`对象,如`handler.reject(error)`，
        // 这样请求将被中止并触发异常，上层catchError会被调用。
      },
      /// 错误拦截
      onError: (DioError err, handler) async {
        final response = Response(statusCode:err.response?.statusCode??-1,data: {'code':1,'msg':"无法连接到服务器，请稍后重试。",},requestOptions: err.requestOptions);
        // Log.e(err.response?.statusCode);
        return  handler.resolve(response);//continue
        // 如果你想完成请求并返回一些自定义数据，可以resolve 一个`Response`,如`handler.resolve(response)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
      }
    );
  }
}
