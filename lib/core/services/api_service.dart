import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<dynamic> post({
    required dynamic data,
    required String url,
    required String token,
  }) async {
    var response = await dio.post(
      url,
      data: data,
      options: Options(
        headers: {
          'Authorization': 'Token $token',
          'Content-Type': 'application/json',
        },
      ),
    );
    return response.data;
  }
}
