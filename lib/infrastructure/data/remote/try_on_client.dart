import 'package:dio/dio.dart';

class TryOnApiClient {
  final Dio dio;

  TryOnApiClient() : dio = Dio();

  Future<Response> requestTryOn(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    return await dio.post(
      endpoint,
      data: data,
    );
  }
}
