import 'package:dio/dio.dart';
import 'endpoints.dart';

class DioHelper {
  static late Dio dio;

  static init() async {
    dio = Dio(
      BaseOptions(
          baseUrl: EndPonits.baseUle,
          receiveDataWhenStatusError: true,
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          }),
    );
  }

  static Future<Response> getData(
      {required String endpoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) async {
    dio.options.headers = headers;
    return await dio.get(
      endpoint,
      queryParameters: queryParameters,
      data: body,
    );
  }

  static Future<Response> post(
      {required String endpoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) async {
    dio.options.headers = headers;
    return await dio.post(
      endpoint,
      queryParameters: queryParameters,
      data: body,
    );
  }

  static Future<Response> put(
      {required String endpoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) async {
    dio.options.headers = headers;
    return await dio.put(
      endpoint,
      queryParameters: queryParameters,
      data: body,
    );
  }

  static Future<Response> patch(
      {required String endpoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) async {
    dio.options.headers = headers;
    return await dio.patch(
      endpoint,
      queryParameters: queryParameters,
      data: body,
    );
  }

  static Future<Response> delete(
      {required String endpoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) async {
    dio.options.headers = headers;
    return await dio.delete(
      endpoint,
      queryParameters: queryParameters,
      data: body,
    );
  }
}
