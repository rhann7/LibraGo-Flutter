import 'package:dio/dio.dart';
import 'api_service.dart';
import 'storage_service.dart';
import '../models/auth.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: Apis.baseUrl,
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    headers: {
      'Accept': 'application/json'
    }
  ));
  
  Future<Map<String, dynamic>> register(AuthRequest req) async {
  try {
    final formData = FormData.fromMap({
      "name": req.name,
      "username": req.username,
      "email": req.email,
      "password": req.password,
    });

    final response = await _dio.post(
      '/register',
      data: formData,
      options: Options(
        headers: {
          "Content-Type": "multipart/form-data",
        },
      ),
    );

    return response.data;
  } on DioException catch (e) {
    print("ERROR RESPONSE: ${e.response?.data}");
    return {"status": "error", "message": e.response?.data.toString()};
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