import 'package:dio/dio.dart';

import 'dio.dart';

const baseUrl = "http://185.132.38.189:3928/api/";
// const API_KEY = "fb12a31181aa4498ba52877978913275";

class HttpServiceImpl implements HttpService {
  late Dio _dio;

  HttpServiceImpl() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        // headers: {"Authorization": "Bearer $API_KEY"}
      ),
    );

    initializeInterceptors();
  }

  @override
  Future<Response> getRequest(String url,
      {Map<String, dynamic>? parameters}) async {
    // TODO: implement getRequest

    Response response;
    try {
      response = await _dio.get(url, queryParameters: parameters);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  @override
  Future<Response> post(String url, Map<String, dynamic> data) async {
    Response response = await _dio.post(url, data: data);
    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(onError: (error, error1) {
        print(error.message);
        error1.next(error);
      }, onRequest: (request, request1) {
        print("${request.method} | ${request.path}");
        request1.next(request);
      }, onResponse: (response, response1) {
        print(
            "${response.statusCode} ${response.statusMessage} ${response.data}");
        response1.next(response);
      }),
    );
  }

  // @override
  // void init() {
  //   print('init');
  //   _dio = Dio(
  //     BaseOptions(
  //       baseUrl: baseUrl,
  //       // headers: {"Authorization": "Bearer $API_KEY"}
  //     ),
  //   );
  //
  //   // initializeInterceptors();
  // }
}
