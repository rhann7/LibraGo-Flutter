import 'package:dio/dio.dart';
import 'api_service.dart';
import 'storage_service.dart';
import '../models/user.dart';

class UserService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: Apis.baseUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    headers: {'Accept': 'application/json'}
  ));

  Future<User?> show(String username) async {
    try {
      final token = await StorageService.getToken();
      final response = await _dio.get(
        Apis.profile.replaceFirst('{user:username}', username),
        options: Options(headers: {
          'Authorization': 'Bearer $token'
        })
      );

      if (response.data['status'] == 'success') {
        return User.fromJson(response.data['data']);
      }

      return null;
    } on DioException catch (e) {
      print('Gagal memuat profil: ${e.message}');
      return null;
    }
  }

  Future<Map<String, dynamic>> update({required String username, required Map<String, dynamic> data, String? avatar}) async {
    try {
      final token = await StorageService.getToken();

      dynamic requestData = data;
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      if (avatar != null) {
        requestData = FormData.fromMap({
          ...data, 'avatar': await MultipartFile.fromFile(avatar)
        });
      }

      final response = await _dio.put(
        Apis.profile.replaceFirst('{user:username}', username),
        data: requestData,
        options: options
      );

      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 422) {
        return e.response!.data;
      }

      return {'status': 'error', 'message': e.message};
    }
  }
}