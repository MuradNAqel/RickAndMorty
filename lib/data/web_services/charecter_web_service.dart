import 'package:breaking_bad/constants/settings.dart';
import 'package:dio/dio.dart';

class CharecterWebService {
  late Dio dio;

  CharecterWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      //connectTimeout: const Duration(seconds: 123),
      //receiveTimeout: const Duration(seconds: 123),
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getCharecters(int page) async {
    try {
      Response response = await dio.get('character?page=$page');
      print(response.data.toString());
      return response.data['results'];
    } catch (e) {
      print("charecters web service " + e.toString());
      return [];
    }
  }
}
