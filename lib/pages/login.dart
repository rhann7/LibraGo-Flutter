import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/auth_service.dart';
import '../models/auth.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();

  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    final req = AuthRequest(
        email: _emailController.text, password: _passwordController.text);
    final result = await _authService.login(req);

    setState(() {
      _isLoading = false;
    });

    if (result['status'] == 'success') {
      if (!mounted) return;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result['message'] ?? 'Login Gagal')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF093FB4),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/logo.png'), height: 28),
                SizedBox(width: 6),
                Text(
                  "Libra",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Go",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    color: Color(0xFF062A75),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Masuk Akun",
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          color: Color(0xFF062A75),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(0, -45),
                        child: Image.asset(
                          'assets/bookyellow.png',
                          height: 90,
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Masukkan email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xFFEDEEF8),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Masukkan password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xFFEDEEF8),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 40),
                  SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    onPressed: _isLoading ? null : _login, // disable kalau lagi loading
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF062A75),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15),
    ),
    child: _isLoading
        ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
          )
        : Text(
            "Masuk",
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
  ),
),

                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Belum punya akun? ",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(
                    "Daftar di sini",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Color(0xFFF5BB37),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}
