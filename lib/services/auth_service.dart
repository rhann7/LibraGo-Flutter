import 'package:dio/dio.dart';
import 'api_service.dart';
import 'storage_service.dart';
import '../models/auth.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: Apis.baseUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    headers: {'Accept': 'application/json', 'Content-Type': 'application/json'}
  ));

  Future<Map<String, dynamic>> register(AuthRequest req) async {
    try {
      final response = await _dio.post(
        Apis.register,
        data: req.toJsonRegister()
      );

      return response.data;
    } on DioException catch (e) {
      return {'status': 'error', 'message': e.message};
    }
  }

  Future<Map<String, dynamic>> login(AuthRequest req) async {
    try {
      final response = await _dio.post(
        Apis.login,
        data: req.toJsonLogin()
      );

      if (response.data['status'] == 'success') {
        await StorageService.saveToken(response.data['token']);
      }

      return response.data;
    } on DioException catch (e) {
      return {'status': 'error', 'message': e.message};
    }
  }

  Future<Map<String, dynamic>> logout(String token) async {
    try {
      final response = await _dio.post(
        Apis.logout,
        options: Options(headers: {
          'Authorization': 'Bearer $token'
        })
      );
      
      return response.data;
    } on DioException catch (e) {
      return {'status': 'error', 'message': e.message};
    }
  }
}