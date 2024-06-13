import 'package:pdax_exam/presentation/utility/constants.dart' as constants;
import 'package:pdax_exam/presentation/utility/global.dart' as global;
import 'package:dio/dio.dart';


class MyDioServices {
  late Dio _dio;
  String token = constants.empty;

  MyDioServices() {
    _dio = Dio(BaseOptions(
      baseUrl: global.apiBaseUrl,
    ));

    _initializeInterceptors();
  }

  Future<Response> getRequest(String endPoint) async {
    Response response;

    var headers = {
      constants.capAccept: constants.jsonApplication,
    };

    try {
      response = await _dio.get(endPoint, options: Options(
        method: constants.capsGet,
        headers: headers,
      ));
    } on DioException catch (e) {
      throw Exception(e.message);
    }
     return response;
  }

  _initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper());
  }
}