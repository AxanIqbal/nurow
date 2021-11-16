import 'package:dio/dio.dart';

abstract class HttpService {
  // void init();

  Future<Response> getRequest(String url, {Map<String, dynamic>? parameters});

  Future<Response> post(String url, Map<String, dynamic> data);
}
