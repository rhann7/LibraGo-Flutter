import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/storage_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Homepage')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Selamat datang! Tes autentikasi berhasil!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final token = await StorageService.getToken();
                if (token != null) {
                  final res = await AuthService().logout(token);
                  if (res['status'] == 'success') {
                    await StorageService.clearToken();
                    Navigator.pushReplacementNamed(context, '/login');
                  }
                }
              },
              child: const Text('Logout'),
            )
          ]
        )
      )
    );
  }
}