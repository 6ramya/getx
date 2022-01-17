import 'package:dio/dio.dart';
import 'package:getx_demo/service/http_service.dart';

const BASE_URL = "https://newsapi.org/";
const API_KEY = "61a1540289d14b34af5fd15a485ea386";

class HttpServiceImpl implements HttpService {
  late Dio _dio;
  @override
  Future<Response> getRequest(String url) async {
    Response? response;
    try {
      final response = await _dio.get(url);
      print(response.data);

      return response;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    // return response!;
  }

  initializeInterceptors() {
    _dio.interceptors
        .add(InterceptorsWrapper(onError: (error, ErrorInterceptorHandler) {
      print(error.message);
    }, onRequest: (request, requestInterceptorHandler) {
      print("${request.method} ${request.path} ${request}");
    }, onResponse: (response, RequestInterceptorHandler) {
      print(
          "${response.statusCode} ${response.statusMessage} ${response.data}");
    }));
  }

  @override
  void init() {
    _dio = Dio(BaseOptions(
        baseUrl: BASE_URL, headers: {"Authorization": "Bearer $API_KEY"}));
    // initializeInterceptors();
  }
}
