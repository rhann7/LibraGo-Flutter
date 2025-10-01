import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:librago/pages/auth/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LibraGo',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF093FB4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/logo.png'), height: 28),
                SizedBox(width: 6),
                Text(
                  "Libra",
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Go",
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    color: Color(0xFF062A75),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Image(image: AssetImage('assets/splash.png'), height: 350),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Akses ",
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Buku ",
                  style: GoogleFonts.atma(
                    fontSize: 26,
                    color: Color(0xFFF5BB37),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Tanpa",
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2),
            Text(
              "Batas",
              style: GoogleFonts.poppins(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF062A75),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 120, vertical: 15),
              ),
              child: Text(
                "Lanjutkan",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
